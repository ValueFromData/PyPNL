/////////////////////////////////////////////////////////////////////////////
//                                                                         //
//                INTEL CORPORATION PROPRIETARY INFORMATION                //
//   This software is supplied under the terms of a license agreement or   //
//  nondisclosure agreement with Intel Corporation and may not be copied   //
//   or disclosed except in accordance with the terms of that agreement.   //
//       Copyright (c) 2003 Intel Corporation. All Rights Reserved.        //
//                                                                         //
//  File:      pnl2DNumericDenseMatrix.cpp                                 //
//                                                                         //
//  Purpose:   Implementation of the algorithm                             //
//                                                                         //
//  Author(s):                                                             //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////
#include "pnlConfig.hpp"
#include "pnl2DNumericDenseMatrix.hpp"
#include "pnliNumericSparseMatrix.hpp"

PNL_BEGIN
/////////////////////////////////////////////////////////////////////////////
//float C2DNumericDenseMatrix

C2DNumericDenseMatrix<float> *C2DNumericDenseMatrix<float>::Create( const int *lineSizes,
                                                                    const float *data, int Clamp )
{
    PNL_CHECK_IS_NULL_POINTER( lineSizes );
    PNL_CHECK_LEFT_BORDER( Clamp, 0 );
    PNL_CHECK_IS_NULL_POINTER( data );

    int i = 0;
    for( i = 0; i < 2; i++ )
    {
        if( lineSizes[i] < 0 )
        {
            PNL_THROW( COutOfRange, "range is negative" )
        }
    }
    PNL_CHECK_IS_NULL_POINTER( data );
    C2DNumericDenseMatrix<float> *pxMatrix = 
                new C2DNumericDenseMatrix<float>( 2, lineSizes, data, (Clamp>0));
    return pxMatrix;
}

C2DNumericDenseMatrix<float>* C2DNumericDenseMatrix<float>
::CreateIdentityMatrix(int lineSize)
{
    PNL_CHECK_LEFT_BORDER( lineSize, 1 )
	int i;
    floatVector data( lineSize*lineSize, 0.0f );
	for( i = 0; i < lineSize; i++ )
	{
		data[i+i*lineSize] = 1.0f;
	}
	intVector ranges( 2, lineSize );
	C2DNumericDenseMatrix<float>* resMat = C2DNumericDenseMatrix<float>::Create( 
        &ranges.front(), &data.front(), 0 );
	PNL_CHECK_IF_MEMORY_ALLOCATED( resMat );
	return resMat;
}

int C2DNumericDenseMatrix<float>::IsSymmetric(float epsilon) const
{
    PNL_CHECK_LEFT_BORDER( epsilon, 0.0f );
    if( m_Range[0] != m_Range[1] )
    {
	return 0;
    }
    int isSym = 1;
    int i,j;
    int size1 = m_Range[0];
    int size2 = m_Range[1];
    for( i = 0; i < size1 ; i++)
    {
	for( j = 0; j <size2; j++ )
	{
            const float a = m_Table[i*size1+j];
            const float b = m_Table[j*size1+i];
            float sum = float(fabs(a)+fabs(b));
	    if( ( sum > FLT_EPSILON ) && fabs(a - b) >= epsilon
                && fabs(a - b)/sum >= epsilon)
	    {
		    isSym = 0;
		    break;
	    }
	}
    }
    return isSym;
}

void C2DNumericDenseMatrix<float>::icvSVBkSb(int m, int n, const float* w,
                    const float* uT, int lduT, int nu,
                    const float* vT, int ldvT,
                    const float* b, int ldb, int nb,
                    float* x, float* buffer)const
{
    icvSVBkSb_32f( m, n, w, uT, lduT, nu, vT, ldvT, b, ldb, nb, x, buffer );
}

void C2DNumericDenseMatrix<float>::icvSVD( float* a, int lda, int m, int n,
                 float* w,
                 float* uT, int lduT, int nu,
                 float* vT, int ldvT,
                 float* buffer )const
{
    icvSVD_32f( a, lda, m, n, w, uT, lduT, nu, vT, ldvT, buffer );
}

C2DNumericDenseMatrix<float>::C2DNumericDenseMatrix( int dim,
                                 const int *range, const float *data, int Clamp)
:iC2DNumericDenseMatrix<float>( dim, range, data, Clamp )
{
}
/*
template <>
C2DNumericDenseMatrix<float>::C2DNumericDenseMatrix( 
                               const C2DNumericDenseMatrix<float> & inputMat )
:iC2DNumericDenseMatrix<float>( inputMat )
{
}
*/
/////////////////////////////////////////////////////////////////////////////
//double C2DNumericDenseMatrix
/*
template <> class C2DNumericDenseMatrix<double> :
                           public iC2DNumericDenseMatrix<double>
{
public:
    static C2DNumericDenseMatrix<double> *Create( const int* lineSizes,
            const double *data, int Clamp = 0 );
    static C2DNumericDenseMatrix<double>* CreateIdentityMatrix( int lineSize );
    int IsSymmetric( double epsilon ) const;
    void icvSVBkSb(int m, int n, const double* w,
                    const double* uT, int lduT, int nu,
                    const double* vT, int ldvT,
                    const double* b, int ldb, int nb,
                    double* x, double* buffer) const;
    void icvSVD( double* a, int lda, int m, int n,
                 double* w,
                 double* uT, int lduT, int nu,
                 double* vT, int ldvT,
                 double* buffer ) const;
    ~C2DNumericDenseMatrix(){};
protected:
    C2DNumericDenseMatrix(int dim, const int *range, const double *data,
                                                                int Clamp);
    C2DNumericDenseMatrix( const iCNumericDenseMatrix<double> & inputMat );
    
private:
};




template <>
C2DNumericDenseMatrix<double>* C2DNumericDenseMatrix<double>::Create( 
                       const int* lineSizes, const double *data, int Clamp )
{
    PNL_CHECK_IS_NULL_POINTER( lineSizes );
    PNL_CHECK_LEFT_BORDER( Clamp, 0 );
    PNL_CHECK_IS_NULL_POINTER( data );

    int i = 0;
    for( i = 0; i < 2; i++ )
    {
        if( lineSizes[i] < 0 )
        {
            PNL_THROW( COutOfRange, "range is negative" )
        }
    }
    PNL_CHECK_IS_NULL_POINTER( data );
    C2DNumericDenseMatrix<double> *pxMatrix = 
                new C2DNumericDenseMatrix<double>( 2, lineSizes, data, (Clamp>0));
    return pxMatrix;
}




template <>
C2DNumericDenseMatrix<double>* C2DNumericDenseMatrix<double>
::CreateIdentityMatrix(int lineSize)
{
    PNL_CHECK_LEFT_BORDER( lineSize, 1 )
	int i;
    pnlVector<double> data( lineSize*lineSize, 0.0 );
	for( i = 0; i < lineSize; i++ )
	{
		data[i+i*lineSize] = 1.0;
	}
	intVector ranges( 2, lineSize );
	C2DNumericDenseMatrix<double>* resMat = C2DNumericDenseMatrix<double>::Create( 
        &ranges.front(), &data.front(), 0 );
	PNL_CHECK_IF_MEMORY_ALLOCATED( resMat );
	return resMat;
}



template <>
int C2DNumericDenseMatrix<double>::IsSymmetric(double epsilon) const
{
	PNL_CHECK_LEFT_BORDER( epsilon, 0.0f );
	if( m_Range[0] != m_Range[1] )
	{
		return 0;
	}
	int isSym = 1;
	int i,j;
	int size1 = m_Range[0];
	int size2 = m_Range[1];
	for( i = 0; i < size1 ; i++)
	{
		for( j = 0; j <size2; j++ )
		{
			if( fabs(m_Table[i*size1+j] - m_Table[j*size1+i] )>=epsilon)
			{
				isSym = 0;
				break;
			}
		}
	}
	return isSym;
}



template <>
void C2DNumericDenseMatrix<double>::icvSVBkSb(int m, int n, const double* w,
                    const double* uT, int lduT, int nu,
                    const double* vT, int ldvT,
                    const double* b, int ldb, int nb,
                    double* x, double* buffer)const
{
    icvSVBkSb_64f( m, n, w, uT, lduT, nu, vT, ldvT, b, ldb, nb, x, buffer );
}

template<>
void C2DNumericDenseMatrix<double>::icvSVD( double* a, int lda, int m, int n,
                 double* w,
                 double* uT, int lduT, int nu,
                 double* vT, int ldvT,
                 double* buffer )const
{
    icvSVD_64f( a, lda, m, n, w, uT, lduT, nu, vT, ldvT, buffer );
}

template <>
C2DNumericDenseMatrix<double>::C2DNumericDenseMatrix( int dim,
                                 const int *range, const double *data, int Clamp)
:iC2DNumericDenseMatrix<double>( dim, range, data, Clamp )
{
}*/
/*
template <>
C2DNumericDenseMatrix<double>::C2DNumericDenseMatrix( 
                               const C2DNumericDenseMatrix<double> & inputMat )
                               :iC2DNumericDenseMatrix<double>( inputMat )
{
}
*/

#ifdef PNL_RTTI
template <>
const CPNLType C2DNumericDenseMatrix< float >::m_TypeInfo = CPNLType("C2DNumericDenseMatrix", &(iC2DNumericDenseMatrix< Type >::m_TypeInfo));

#endif
PNL_END
