From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 11:27:34 +0200
Subject: [Buildroot] [PATCH 2/3] package/pkg-cmake.mk: don't
 unconditionally set CMAKE_CXX_COMPILER
In-Reply-To: <20210402163343.1254491-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 2 Apr 2021 18:33:42 +0200")
References: <20210402163343.1254491-1-fontaine.fabrice@gmail.com>
 <20210402163343.1254491-2-fontaine.fabrice@gmail.com>
Message-ID: <875z122yd5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Don't unconditionally set CMAKE_CXX_COMPILER as it will raise a build
 > failure on qpid-proton because "if the toolchain specifies a value for
 > CMAKE_CXX_COMPILER, then CMake assumes the compiler works and goes
 > straight ahead trying to use it":
 > https://cmake.org/cmake/help/latest/module/CheckLanguage.html
 > https://issues.apache.org/jira/browse/PROTON-2365

 > Fixes:
 >  - http://autobuild.buildroot.org/results/05f344151100219c159ca4d466a453df96bf07fa

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
