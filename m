From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 12 Mar 2012 03:19:23 +0100
Subject: [Buildroot] [PATCH v1 0/1] New package : GSL The GNU Scientific
	Library
Message-ID: <1331518764-27555-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers. It is free software under the GNU General Public License.

The library provides a wide range of mathematical routines such as random number generators, special functions and least-squares fitting. There are over 1000 functions in total with an extensive test suite.

The complete range of subject areas covered by the library includes,
Complex Numbers 	Roots of Polynomials
Special Functions 	Vectors and Matrices
Permutations 		Sorting
BLAS Support 		Linear Algebra
Eigensystems 		Fast Fourier Transforms
etc...

Sagaert Johan (1):
  libgsl : new package  The GNU Scientific Library

 package/Config.in        |    1 +
 package/libgsl/Config.in |    5 +++++
 package/libgsl/gsl.mk    |   12 ++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 package/libgsl/Config.in
 create mode 100644 package/libgsl/gsl.mk

-- 
1.7.9.3
