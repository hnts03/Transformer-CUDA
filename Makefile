NVCC=nvcc
NVCFLAG= -rdc=true -O3

# Source Files
SRC=bmm.cu dotProd.cu matMul.cu softmax.cu checkDPsupport.cu \
	matAdd.cu relu.cu vectAdd.cu layernorm.cu matScale.cu transpose.cu

# EXE name
TARGET=$(SRC:.cu=)

# Default rule to compile and link
all: $(TARGET)

# Rule to compile each .cu file into .o file
%: %.cu
	$(NVCC) $(NVCFLAG) $< -o $@

# Clean rule
clean:
	rm -f $(TARGET)
