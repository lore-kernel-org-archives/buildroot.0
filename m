From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Feb 2015 22:37:01 +0100
Subject: [Buildroot] [PATCH v2 1/3] qt5: bump to version 5.4.0
In-Reply-To: <1421930279-3694-1-git-send-email-fatih.asici@gmail.com> ("Fatih
 \=\?utf-8\?B\?QcWfxLFjxLEiJ3M\=\?\= message of "Thu,
 22 Jan 2015 14:37:57 +0200")
References: <1421930279-3694-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <87iofkgflu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

 > qt5base:
 >   - Add patches to fix uClibc build.

 > qt5connectivity:
 >   - Add patches to fix build with -no-c++11

 > qt5declarative:
 >   - Remove the line that installs accessible plugin. The functionality
 >     is moved into the qtquick library.

 > qt5webkit:
 >   - Remove egl patch. This should be fixed with CONFIG += egl option.

 > qt5websockets:
 >   - Remove upstreamed patch.

 > Changelogs: https://qt-project.org/wiki/Change-files-in-Qt-5.4.0
 > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - Check uClibc backtrace support in uClibc build fix.
 >   - Fix qt5connectivity build when C++11 support is not available.
 >   - Move removal of -no-c++11 option into a separate patch.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
