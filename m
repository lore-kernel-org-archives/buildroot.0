From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 23:19:30 +0100
Subject: [Buildroot] [PATCH 1/1] python-numpy: fix build with lapack
In-Reply-To: <20181128165102.4875-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 28 Nov 2018 17:51:02 +0100")
References: <20181128165102.4875-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvju1cel.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > If BR2_PACKAGE_LAPACK is enabled (without BR2_PACKAGE_CLAPACK), build of
 > python-numpy will fail if lapack is built before python-numpy because
 > lapack does not provide blas library

 > So disable BLAS and LAPACK through PYTHON_NUMPTY_ENV if
 > BR2_PACKAGE_CLAPACK is not set

 > Fixes:
 >  - http://autobuild.buildroot.org/results/41671976c7be7883f31ee5f51ca0eb90b81262fd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
