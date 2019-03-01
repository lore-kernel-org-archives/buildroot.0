From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Mar 2019 10:11:24 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] support/dependencies: require at least CMake 3.8
In-Reply-To: <20190227192558.19183-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 27 Feb 2019 20:25:58 +0100")
References: <20190227192558.19183-1-fontaine.fabrice@gmail.com>
Message-ID: <87ef7rufgj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gerbera package in version 1.3 unfortunately now requires CMake >= 3.8
 > for C++17 macros:
 > https://github.com/gerbera/gerbera/commit/b5fd39f30fb10385ec228b71377685206a609c3a

 > So we need to bump our requirement from 3.1 to 3.8. If the host doesn't
 > have a CMake >= 3.8, Buildroot will build its own host-cmake package.

 > Also drop patch that relax cmake requirement on json-for-modern-cpp

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6405647b47b132ff5d0d211b92d407322d52d507

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Put back a slightly updated comment
 >  - Drop patch on json-for-modern-cpp

Committed, thanks.

-- 
Bye, Peter Korsgaard
