CXXFLAGS = -ggdb -O2 -ftree-vectorize -march=native -Wall -I${HOME}/include `pkg-config --cflags opencv`
LIBS = -L${HOME}/lib -lANN -lddtsa `pkg-config --libs opencv`
TARGETS = $(buildtree_TARGET) $(classifytrajectory_TARGET)
OBJS = $(buildtree_OBJS) $(classifytrajectory_OBJS)

buildtree_TARGET = buildtree
buildtree_OBJS = BuildTree.o TDEModel.o Utils.o
$(buildtree_TARGET): $(buildtree_OBJS)
	$(CXX) -o $(buildtree_TARGET) $(buildtree_OBJS) $(LIBS)

classifytrajectory_TARGET = classifytrajectory
classifytrajectory_OBJS = ClassifyTrajectory.o Classifier.o TDEModel.o Utils.o
$(classifytrajectory_TARGET): $(classifytrajectory_OBJS)
	$(CXX) $(CXXFLAGS) -o $(classifytrajectory_TARGET) $(classifytrajectory_OBJS) $(LIBS)

all:	$(TARGETS)

clean:
	rm -f $(OBJS) $(TARGETS)