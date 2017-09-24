From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Sep 2017 09:04:39 +0200
Subject: [Buildroot] [PATCH] openjpeg: fix build without C++ support
In-Reply-To: <20170923171812.9111-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 23 Sep 2017 19:18:12 +0200")
References: <20170923171812.9111-1-peter@korsgaard.com>
Message-ID: <87vak8lgqg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/e2f/e2ff0a7fa2b911157edf6c43a8eed797b22edd46/
 > http://autobuild.buildroot.net/results/670/6706339e7df2f2e7d0d7a15663bed185ca55c2a1/

 > Openjpeg is written in C, but with the move to CMake the build system now
 > errors out if a C++ compiler isn't available.  Fix it by patching the
 > CMakeLists.txt to not require C++ support.

 > Patch submitted upstream:
 > https://github.com/uclouvain/openjpeg/pull/1027

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
