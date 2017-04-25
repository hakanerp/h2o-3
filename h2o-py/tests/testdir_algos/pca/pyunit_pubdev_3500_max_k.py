from __future__ import print_function
from builtins import range
import sys
sys.path.insert(1,"../../../")
import h2o
from tests import pyunit_utils
from h2o.transforms.decomposition import H2OPCA



def pca_max_k():
  data = h2o.import_file(path=pyunit_utils.locate("smalldata/prostate/prostate_cat.csv"))  # Nidhi: import may not work

  pcaGramSVD = H2OPCA(k=-1, transform="STANDARDIZE", pca_method="GramSVD")
  pcaGramSVD.train(x=list(range(0, data.ncols)), training_frame=data)

  pcaPower = H2OPCA(k=-1, transform="STANDARDIZE", pca_method="Power")
  pcaPower.train(x=list(range(0, data.ncols)), training_frame=data)

  pcaRandomized = H2OPCA(k=-1, transform="STANDARDIZE", pca_method="Randomized")
  pcaRandomized.train(x=list(range(0, data.ncols)), training_frame=data)

  pcaGLRM = H2OPCA(k=-1, transform="STANDARDIZE", pca_method="GLRM")
  pcaGLRM.train(x=list(range(0, data.ncols)), training_frame=data)

if __name__ == "__main__":
  pyunit_utils.standalone_test(pca_max_k)
else:
  pca_max_k()
