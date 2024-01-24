// ECECS-5544 S24 Assignment 1: FunctionInfo.cpp
// PID:
////////////////////////////////////////////////////////////////////////////////


#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>

using namespace llvm;

namespace {
  class FunctionInfo : public FunctionPass {
  public:
    static char ID;
    FunctionInfo() : FunctionPass(ID) { }
    ~FunctionInfo() { }

    // We don't modify the program, so we preserve all analyses
    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesAll();
    }

    // Do some initialization
    bool doInitialization(Module &M) override {
      errs() << "5984 Function Information Pass\n"; // TODO: remove this.
      // outs() << "Name,\tArgs,\tCalls,\tBlocks,\tInsns\n,\tAdd/Sub,\tMul/Div,\tBr(Cond),\tBr(UnCond)";

      return false;
    }

    // Print output for each function
    bool runOnFunction(Function &F) override {
      // outs() << "name" << ",\t" << "args" << ",\t" << "calls" << ",\t" << "bbs" << ",\t" << "insts ...." << "\n";
      // TODO: remove this
      outs() << "Inside Function: "<<F.getName()<<"\n";
      return false;
    }
  };
}

// LLVM uses the address of this static member to identify the pass, so the
// initialization value is unimportant.
char FunctionInfo::ID = 0;
static RegisterPass<FunctionInfo> X("function-info", "5544: Function Information", false, false);
