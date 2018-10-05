From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 22:13:05 +0200
Subject: [Buildroot] [PATCH 1/1] x265: disable parallel build
In-Reply-To: <20181001205739.27140-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 1 Oct 2018 22:57:39 +0200")
References: <20181001205739.27140-1-fontaine.fabrice@gmail.com>
Message-ID: <871s9417am.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > It seems package has a parallel build issue on ARM cortex A8 or A9 since
 > at least version 2.5:

 > [ 94%] Linking CXX shared library libx265.so
 > ipfilter8.S.o: file not recognized: File truncated
 > collect2: error: ld returned 1 exit status
 > CMakeFiles/x265-shared.dir/build.make:221: recipe for target 'libx265.so.160' failed

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f6ea88324a8f9ac8ee780ddd71ec61f922e20210
 >  - http://autobuild.buildroot.org/results/3bd91a5694936650ce936a408ddd50338f65f8b0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>


Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
