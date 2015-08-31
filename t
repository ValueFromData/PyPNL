Making all in cxcore
make[1]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore'
Making all in cxcore
make[2]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore/cxcore'
Making all in src
make[3]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore/cxcore/src'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore/cxcore/src'
Making all in include
make[3]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore/cxcore/include'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore/cxcore/include'
make[3]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore/cxcore'
make[3]: Nothing to be done for `all-am'.
make[3]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore/cxcore'
make[2]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore/cxcore'
make[2]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore'
make[2]: Nothing to be done for `all-am'.
make[2]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore'
make[1]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/cxcore'
Making all in trs
make[1]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/trs'
Making all in src
make[2]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/trs/src'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/trs/src'
Making all in include
make[2]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/trs/include'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/trs/include'
make[2]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/trs'
make[2]: Nothing to be done for `all-am'.
make[2]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/trs'
make[1]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/trs'
Making all in c_pgmtk
make[1]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/c_pgmtk'
Making all in src
make[2]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/c_pgmtk/src'
Making all in include
make[3]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/c_pgmtk/src/include'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/c_pgmtk/src/include'
make[3]: Entering directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/c_pgmtk/src'
/bin/bash ../../libtool --mode=compile g++ -DPACKAGE_NAME=\"pnl\" -DPACKAGE_TARNAME=\"pnl\" -DPACKAGE_VERSION=\"0.2.23\" -DPACKAGE_STRING=\"pnl\ 0.2.23\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"pnl\" -DVERSION=\"0.2.23\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1  -I. -I. -I../../cxcore/cxcore/include -I../../c_pgmtk/include -I../../c_pgmtk/src/include/cart -I../../c_pgmtk/src/include -x c++    -g -O2 -c -o cvcart.lo cvcart.cpp
 g++ -DPACKAGE_NAME=\"pnl\" -DPACKAGE_TARNAME=\"pnl\" -DPACKAGE_VERSION=\"0.2.23\" "-DPACKAGE_STRING=\"pnl 0.2.23\"" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"pnl\" -DVERSION=\"0.2.23\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -I. -I. -I../../cxcore/cxcore/include -I../../c_pgmtk/include -I../../c_pgmtk/src/include/cart -I../../c_pgmtk/src/include -x c++ -g -O2 -c cvcart.cpp  -fPIC -DPIC -o .libs/cvcart.o
In file included from ../../cxcore/cxcore/include/cxtypes.h:45:0,
                 from ../../cxcore/cxcore/include/cxcore.h:77,
                 from ../../c_pgmtk/src/include/cart/datadefs.h:12,
                 from ../../c_pgmtk/src/include/cart/inlines.h:6,
                 from ../../c_pgmtk/src/include/cart/cvcart.h:4,
                 from cvcart.cpp:178:
../../c_pgmtk/src/include/cart/inlines.h: In function 'void icxAssertAligned(void*, int)':
../../c_pgmtk/src/include/cart/inlines.h:183:19: error: cast from 'void*' to 'int' loses precision [-fpermissive]
  assert ( ( ((int)ptr) & (align-1) ) == 0 );
                   ^
In file included from ../../c_pgmtk/src/include/cart/cvcart.h:4:0,
                 from cvcart.cpp:178:
../../c_pgmtk/src/include/cart/inlines.h: In function 'BOOL icxIsChunkLoaded(CxClassifierSampleChunk*)':
../../c_pgmtk/src/include/cart/inlines.h:290:21: error: cast from 'CxClassifierSampleChunk*' to 'int' loses precision [-fpermissive]
 { return (int)(chunk) && (chunk)->is_loaded; }
                     ^
In file included from ../../c_pgmtk/src/include/cart/cvcart.h:4:0,
                 from cvcart.cpp:178:
../../c_pgmtk/src/include/cart/inlines.h: In function 'float Rand(float, float)':
../../c_pgmtk/src/include/cart/inlines.h:1698:41: warning: integer overflow in expression [-Woverflow]
  float f = 1.0f * rand() / (RAND_MAX  + 1) ;
                                         ^
cvcart.cpp: In function 'float cxScanNodeCategoricBestSplitClassification(CxRootedCARTBase*, int*, char*, int)':
cvcart.cpp:6695:47: error: cast from 'float*' to 'BOOL {aka int}' loses precision [-fpermissive]
  BOOL use_priors = (BOOL)(cart->params->priors);
                                               ^
cvcart.cpp: In function 'float cxFindNodeCategoricClusteringBestSplit(CxRootedCARTBase*, CxVarCategoryCluster*, int, int, int, CxCARTSplit*)':
cvcart.cpp:7026:50: error: cast from 'float*' to 'BOOL {aka int}' loses precision [-fpermissive]
     BOOL use_priors = (BOOL)(cart->params->priors);
                                                  ^
cvcart.cpp: In function 'void DumpClusters(FILE*, CxVarCategoryCluster*, int)':
cvcart.cpp:7735:51: warning: format '%d' expects argument of type 'int', but argument 5 has type 'double' [-Wformat=]
      cluster1->num_cats, cluster1->sum_frequencies);
                                                   ^
cvcart.cpp: In function 'void cxDumpCART(FILE*, CxCART*, int)':
cvcart.cpp:8306:56: warning: format '%g' expects argument of type 'double', but argument 7 has type 'int' [-Wformat=]
      data->error_dev / last_error, data->terminal_nodes);
                                                        ^
cvcart.cpp:8306:56: warning: format '%d' expects a matching 'int' argument [-Wformat=]
In file included from ../../c_pgmtk/src/include/cart/inlines.h:6:0,
                 from ../../c_pgmtk/src/include/cart/cvcart.h:4,
                 from cvcart.cpp:178:
cvcart.cpp: In function 'BOOL cxReadSplit(FILE*, CxCARTBase*, CxCARTSplit*&, ESplitType&, char*)':
../../c_pgmtk/src/include/cart/datadefs.h:823:52: warning: format '%d' expects argument of type 'int*', but argument 3 has type 'ESplitType*' [-Wformat=]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                    ^
../../c_pgmtk/src/include/cart/datadefs.h:868:33: note: in expansion of macro 'READ_PARAM_I'
 #define FREAD_PARAM_I(param, i) READ_PARAM_I(file, param, buf, i)
                                 ^
cvcart.cpp:8561:2: note: in expansion of macro 'FREAD_PARAM_I'
  FREAD_PARAM_I    ( PARAM_SPLIT_TYPE,    type)
  ^
cvcart.cpp: In function 'BOOL icxReadCARTTrainParam(FILE*, CxCARTTrainParams*, int, char*)':
../../c_pgmtk/src/include/cart/datadefs.h:823:52: warning: format '%d' expects argument of type 'int*', but argument 3 has type 'CxCARTSplitCriterion*' [-Wformat=]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                    ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8721:9: note: in expansion of macro 'ELIF_READ_PARAM_I'
         ELIF_READ_PARAM_I (PARAM_SPLIT_RULE,           params->splitting_rule)
         ^
cvcart.cpp: In function 'BOOL cxCreatePruningStorage(CxCART*)':
cvcart.cpp:9530:38: error: cast from 'CxPruningData*' to 'BOOL {aka int}' loses precision [-fpermissive]
     return (BOOL)(pruning_storage.buf);
                                      ^
In file included from ../../cxcore/cxcore/include/cxtypes.h:45:0,
                 from ../../cxcore/cxcore/include/cxcore.h:77,
                 from ../../c_pgmtk/src/include/cart/datadefs.h:12,
                 from ../../c_pgmtk/src/include/cart/inlines.h:6,
                 from ../../c_pgmtk/src/include/cart/cvcart.h:4,
                 from cvcart.cpp:178:
cvcart.cpp: In function 'void cxAssertNodeValid(CxCART*, CxCARTNode*)':
cvcart.cpp:9603:23: error: cast from 'CxCARTNode*' to 'unsigned int' loses precision [-fpermissive]
     assert( (unsigned)node - (unsigned)level.buf_nodes < unsigned( (1 << depth) * node_storage.node_size));
                       ^
cvcart.cpp:9603:46: error: cast from 'void*' to 'unsigned int' loses precision [-fpermissive]
     assert( (unsigned)node - (unsigned)level.buf_nodes < unsigned( (1 << depth) * node_storage.node_size));
                                              ^
In file included from ../../c_pgmtk/src/include/cart/inlines.h:6:0,
                 from ../../c_pgmtk/src/include/cart/cvcart.h:4,
                 from cvcart.cpp:178:
cvcart.cpp: In function 'BOOL cxReadNode(FILE*, CxCART*, CxCARTNode*&, char*)':
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:868:33: note: in expansion of macro 'READ_PARAM_I'
 #define FREAD_PARAM_I(param, i) READ_PARAM_I(file, param, buf, i)
                                 ^
cvcart.cpp:8419:2: note: in expansion of macro 'FREAD_PARAM_I'
  FREAD_PARAM_I( PARAM_NUM_FALLENS, num_fallens)
  ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8420:6: note: in expansion of macro 'ELIF_READ_PARAM_I'
      ELIF_READ_PARAM_I( PARAM_DEPTH,   depth)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8421:6: note: in expansion of macro 'ELIF_READ_PARAM_I'
      ELIF_READ_PARAM_I( PARAM_ID,      id)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:868:33: note: in expansion of macro 'READ_PARAM_I'
 #define FREAD_PARAM_I(param, i) READ_PARAM_I(file, param, buf, i)
                                 ^
cvcart.cpp:8452:2: note: in expansion of macro 'FREAD_PARAM_I'
  FREAD_PARAM_I    ( PARAM_NUM_FALLENS,          node->num_fallens)
  ^
../../c_pgmtk/src/include/cart/datadefs.h:826:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%g", &f);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:893:42: note: in expansion of macro 'READ_PARAM_F'
 #define ELIF_READ_PARAM_F(param, f) else READ_PARAM_F(file, param, buf, f)
                                          ^
cvcart.cpp:8453:6: note: in expansion of macro 'ELIF_READ_PARAM_F'
      ELIF_READ_PARAM_F( PARAM_NODE_ERROR,           node->error)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:826:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%g", &f);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:893:42: note: in expansion of macro 'READ_PARAM_F'
 #define ELIF_READ_PARAM_F(param, f) else READ_PARAM_F(file, param, buf, f)
                                          ^
cvcart.cpp:8454:6: note: in expansion of macro 'ELIF_READ_PARAM_F'
      ELIF_READ_PARAM_F( PARAM_SUM_WEIGHTED_FALLENS, node->sum_weighted_fallens)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:826:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%g", &f);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:893:42: note: in expansion of macro 'READ_PARAM_F'
 #define ELIF_READ_PARAM_F(param, f) else READ_PARAM_F(file, param, buf, f)
                                          ^
cvcart.cpp:8455:6: note: in expansion of macro 'ELIF_READ_PARAM_F'
      ELIF_READ_PARAM_F( PARAM_RESPONSE,             node->response.fl)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8456:6: note: in expansion of macro 'ELIF_READ_PARAM_I'
      ELIF_READ_PARAM_I( PARAM_NODE_PRUNING_STEP,    node->pruning_step)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8457:6: note: in expansion of macro 'ELIF_READ_PARAM_I'
      ELIF_READ_PARAM_I( PARAM_NODE_DIRECTION,       node->direction)
      ^
cvcart.cpp: In function 'BOOL cxReadSplit(FILE*, CxCARTBase*, CxCARTSplit*&, ESplitType&, char*)':
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:868:33: note: in expansion of macro 'READ_PARAM_I'
 #define FREAD_PARAM_I(param, i) READ_PARAM_I(file, param, buf, i)
                                 ^
cvcart.cpp:8561:2: note: in expansion of macro 'FREAD_PARAM_I'
  FREAD_PARAM_I    ( PARAM_SPLIT_TYPE,    type)
  ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8562:6: note: in expansion of macro 'ELIF_READ_PARAM_I'
      ELIF_READ_PARAM_I( PARAM_SPLIT_FEATURE, split->feature_idx)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:826:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%g", &f);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:893:42: note: in expansion of macro 'READ_PARAM_F'
 #define ELIF_READ_PARAM_F(param, f) else READ_PARAM_F(file, param, buf, f)
                                          ^
cvcart.cpp:8563:6: note: in expansion of macro 'ELIF_READ_PARAM_F'
      ELIF_READ_PARAM_F( PARAM_SPLIT_WEIGHT,  split->weight)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8564:6: note: in expansion of macro 'ELIF_READ_PARAM_I'
      ELIF_READ_PARAM_I( PARAM_SPLIT_REVERT,  split->revert)
      ^
cvcart.cpp:8572:39: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
   fscanf(file, "%g", &split->value.fl);
                                       ^
cvcart.cpp: In function 'BOOL cxReadCARTTrainParams(FILE*, CxCARTTrainParams*&, int, char*)':
cvcart.cpp:8752:52: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
      fscanf(file , "%d", &num_features_of_interest);
                                                    ^
In file included from ../../c_pgmtk/src/include/cart/inlines.h:6:0,
                 from ../../c_pgmtk/src/include/cart/cvcart.h:4,
                 from cvcart.cpp:178:
cvcart.cpp: In function 'BOOL icxReadCARTTrainParam(FILE*, CxCARTTrainParams*, int, char*)':
../../c_pgmtk/src/include/cart/datadefs.h:858:23: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
   READ_AI(file, ar, n);     \
                       ^
../../c_pgmtk/src/include/cart/datadefs.h:876:38: note: in expansion of macro 'READ_PARAM_AI'
 #define FREAD_PARAM_AI(param, ar, n) READ_PARAM_AI(file, param, buf, ar, n)
                                      ^
cvcart.cpp:8717:5: note: in expansion of macro 'FREAD_PARAM_AI'
     FREAD_PARAM_AI( PARAM_FEATURES_OF_INTEREST,
     ^
../../c_pgmtk/src/include/cart/datadefs.h:865:23: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
   READ_AI(file, ar, n);     \
                       ^
../../c_pgmtk/src/include/cart/datadefs.h:898:47: note: in expansion of macro 'READ_PARAM_AF'
 #define ELIF_READ_PARAM_AF(param, ar, n) else READ_PARAM_AF(file, param, buf, ar, n)
                                               ^
cvcart.cpp:8720:9: note: in expansion of macro 'ELIF_READ_PARAM_AF'
         ELIF_READ_PARAM_AF( PARAM_PRIORS,              params->priors_mat->data.fl, num_resp)
         ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8721:9: note: in expansion of macro 'ELIF_READ_PARAM_I'
         ELIF_READ_PARAM_I (PARAM_SPLIT_RULE,           params->splitting_rule)
         ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8722:9: note: in expansion of macro 'ELIF_READ_PARAM_I'
         ELIF_READ_PARAM_I (PARAM_NUM_COMPETITORS,      params->num_competitors)
         ^
../../c_pgmtk/src/include/cart/datadefs.h:826:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%g", &f);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:893:42: note: in expansion of macro 'READ_PARAM_F'
 #define ELIF_READ_PARAM_F(param, f) else READ_PARAM_F(file, param, buf, f)
                                          ^
cvcart.cpp:8723:9: note: in expansion of macro 'ELIF_READ_PARAM_F'
         ELIF_READ_PARAM_F (PARAM_COMPETITOR_THRESHOLD, params->competitor_threshold)
         ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8724:9: note: in expansion of macro 'ELIF_READ_PARAM_I'
         ELIF_READ_PARAM_I (PARAM_NUM_SURROGATES,       params->num_surrogates)
         ^
../../c_pgmtk/src/include/cart/datadefs.h:826:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%g", &f);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:893:42: note: in expansion of macro 'READ_PARAM_F'
 #define ELIF_READ_PARAM_F(param, f) else READ_PARAM_F(file, param, buf, f)
                                          ^
cvcart.cpp:8725:9: note: in expansion of macro 'ELIF_READ_PARAM_F'
         ELIF_READ_PARAM_F (PARAM_SURROGATE_THRESHOLD,  params->surrogate_threshold)
         ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8726:9: note: in expansion of macro 'ELIF_READ_PARAM_I'
         ELIF_READ_PARAM_I (PARAM_MAX_DEPTH,            params->tree_max_depth)
         ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8727:9: note: in expansion of macro 'ELIF_READ_PARAM_I'
         ELIF_READ_PARAM_I (PARAM_SPLIT_MIN_POINTS,     params->split_min_points)
         ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8728:9: note: in expansion of macro 'ELIF_READ_PARAM_I'
         ELIF_READ_PARAM_I (PARAM_SPLIT_MAX_POINTS,     params->split_max_points)
         ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8729:9: note: in expansion of macro 'ELIF_READ_PARAM_I'
         ELIF_READ_PARAM_I (PARAM_NUM_CLUSTERS,         params->max_clusters)
         ^
../../c_pgmtk/src/include/cart/datadefs.h:826:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%g", &f);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:893:42: note: in expansion of macro 'READ_PARAM_F'
 #define ELIF_READ_PARAM_F(param, f) else READ_PARAM_F(file, param, buf, f)
                                          ^
cvcart.cpp:8730:9: note: in expansion of macro 'ELIF_READ_PARAM_F'
         ELIF_READ_PARAM_F (PARAM_ALPHA_STOP,           params->alpha)
         ^
cvcart.cpp: In function 'BOOL cxReadFeatureTypes(FILE*, int*&, int&, int&, char*)':
cvcart.cpp:8807:41: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
      fscanf(file , "%d",  &num_features);
                                         ^
In file included from ../../c_pgmtk/src/include/cart/inlines.h:6:0,
                 from ../../c_pgmtk/src/include/cart/cvcart.h:4,
                 from cvcart.cpp:178:
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8816:2: note: in expansion of macro 'ELIF_READ_PARAM_I'
  ELIF_READ_PARAM_I ( PARAM_RESPONSE_TYPE, response_type)
  ^
../../c_pgmtk/src/include/cart/datadefs.h:858:23: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
   READ_AI(file, ar, n);     \
                       ^
../../c_pgmtk/src/include/cart/datadefs.h:897:47: note: in expansion of macro 'READ_PARAM_AI'
 #define ELIF_READ_PARAM_AI(param, ar, n) else READ_PARAM_AI(file, param, buf, ar, n)
                                               ^
cvcart.cpp:8817:6: note: in expansion of macro 'ELIF_READ_PARAM_AI'
      ELIF_READ_PARAM_AI( PARAM_FEATURE_TYPES, types, num_features)
      ^
cvcart.cpp: In function 'BOOL cxReadAllNodes(FILE*, CxCART*, char*)':
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:868:33: note: in expansion of macro 'READ_PARAM_I'
 #define FREAD_PARAM_I(param, i) READ_PARAM_I(file, param, buf, i)
                                 ^
cvcart.cpp:8834:2: note: in expansion of macro 'FREAD_PARAM_I'
  FREAD_PARAM_I(PARAM_NUM_NODES , cart->num_nodes)
  ^
cvcart.cpp: In function 'BOOL cxReadPruningData(FILE*, CxPruningData*&, char*)':
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:868:33: note: in expansion of macro 'READ_PARAM_I'
 #define FREAD_PARAM_I(param, i) READ_PARAM_I(file, param, buf, i)
                                 ^
cvcart.cpp:8957:2: note: in expansion of macro 'FREAD_PARAM_I'
  FREAD_PARAM_I     ( PARAM_PRUNING_STEP,       data->step)
  ^
../../c_pgmtk/src/include/cart/datadefs.h:823:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%d", &i);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:892:42: note: in expansion of macro 'READ_PARAM_I'
 #define ELIF_READ_PARAM_I(param, i) else READ_PARAM_I(file, param, buf, i)
                                          ^
cvcart.cpp:8958:6: note: in expansion of macro 'ELIF_READ_PARAM_I'
      ELIF_READ_PARAM_I ( PARAM_TERMINAL_NODES,     data->terminal_nodes)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:826:53: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
  if (strcmp(buf, param) == 0) fscanf(file, "%g", &f);
                                                     ^
../../c_pgmtk/src/include/cart/datadefs.h:893:42: note: in expansion of macro 'READ_PARAM_F'
 #define ELIF_READ_PARAM_F(param, f) else READ_PARAM_F(file, param, buf, f)
                                          ^
cvcart.cpp:8959:6: note: in expansion of macro 'ELIF_READ_PARAM_F'
      ELIF_READ_PARAM_F ( PARAM_ALPHA,              data->alpha)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:832:25: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
   fscanf(file, "%g", &f);     \
                         ^
../../c_pgmtk/src/include/cart/datadefs.h:894:42: note: in expansion of macro 'READ_PARAM_D'
 #define ELIF_READ_PARAM_D(param, f) else READ_PARAM_D(file, param, buf, f)
                                          ^
cvcart.cpp:8960:6: note: in expansion of macro 'ELIF_READ_PARAM_D'
      ELIF_READ_PARAM_D ( PARAM_REESTIMATION_ERROR, data->reestimation_error)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:832:25: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
   fscanf(file, "%g", &f);     \
                         ^
../../c_pgmtk/src/include/cart/datadefs.h:894:42: note: in expansion of macro 'READ_PARAM_D'
 #define ELIF_READ_PARAM_D(param, f) else READ_PARAM_D(file, param, buf, f)
                                          ^
cvcart.cpp:8961:6: note: in expansion of macro 'ELIF_READ_PARAM_D'
      ELIF_READ_PARAM_D ( PARAM_TEST_SAMPLE_ERROR,  data->test_sample_error)
      ^
../../c_pgmtk/src/include/cart/datadefs.h:832:25: warning: ignoring return value of 'int fscanf(FILE*, const char*, ...)', declared with attribute warn_unused_result [-Wunused-result]
   fscanf(file, "%g", &f);     \
                         ^
../../c_pgmtk/src/include/cart/datadefs.h:894:42: note: in expansion of macro 'READ_PARAM_D'
 #define ELIF_READ_PARAM_D(param, f) else READ_PARAM_D(file, param, buf, f)
                                          ^
cvcart.cpp:8962:6: note: in expansion of macro 'ELIF_READ_PARAM_D'
      ELIF_READ_PARAM_D ( PARAM_ERROR_DEVIATION,    data->error_dev)
      ^
make[3]: *** [cvcart.lo] Error 1
make[3]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/c_pgmtk/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/c_pgmtk/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/faizal/myApps/pnl-probabilistic-networks-library-fixed/c_pgmtk'
make: *** [all-recursive] Error 1
