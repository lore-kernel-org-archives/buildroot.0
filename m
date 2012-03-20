From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Mar 2012 00:16:56 +0100
Subject: [Buildroot] [PATCH v1 0/1] new package : gsl the GNU Scientific
	Library.
Message-ID: <1332285417-2158-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers. It is free software under the GNU General Public License.

The library provides a wide range of mathematical routines such as random number generators, special functions and least-squares fitting. There are over 1000 functions in total with an extensive test suite.

The complete range of subject areas covered by the library includes,
Complex Numbers, Roots of Polynomials, Special Functions, Vectors and Matrices,
Permutations, Sorting, BLAS Support, Linear Algebra, Eigensystems, Fast Fourier Transforms,
Quadrature, Random Numbers, Quasi-Random Sequences, Random Distributions, Statistics,
Histograms, N-Tuples, Monte Carlo Integration,Simulated Annealing ,etc...

Sagaert Johan (1):  new package : gsl the GNU Scientific Library.

 package/Config.in        |    1 +
 package/libgsl/Config.in |    8 ++++++++
 package/libgsl/gsl.mk    |   11 +++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/libgsl/Config.in
 create mode 100644 package/libgsl/gsl.mk

-- 
1.7.9.3
