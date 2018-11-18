From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 19:02:21 +0100
Subject: [Buildroot] [PATCH 1/1] flatcc: fix debug build
In-Reply-To: <20181118165848.2111-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Nov 2018 17:58:48 +0100")
References: <20181118165848.2111-1-fontaine.fabrice@gmail.com>
Message-ID: <87muq6nu1e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > flatcc is named flatcc_d if BR2_ENABLE_DEBUG is set because of the
 > following line in CMakeLists.txt: set(CMAKE_DEBUG_POSTFIX "_d")

 > So update FLATCC_TARGET_REMOVE_FLATCC_COMPILER hook to replace flatcc
 > by flatcc*

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a47f49cd2fdd809257bd7e83dca620f2e6aac85b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
