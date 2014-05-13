From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 May 2014 23:45:28 +0200
Subject: [Buildroot] [PATCH] flann: disallow static library build
In-Reply-To: <1400013937-27184-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 13 May 2014 22:45:37 +0200")
References: <1400013937-27184-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738gduzd3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Even though flann build system uses CMake, it always tries to build a
 > shared library, even if BUILD_SHARED_LIBS=OFF is passed. It could
 > probably be fixed in flann's CMakeLists.txt, but that's not really
 > worth the effort if upstream doesn't support it.

 > Therefore, we simply disallow the flann package in purely static
 > builds.

 > Fixes:

 >   http://autobuild.buildroot.org/results/a4e/a4ec0e9f28cd12ce770718fb407bbb4dc93b528b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
