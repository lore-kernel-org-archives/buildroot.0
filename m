From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 00:02:31 +0200
Subject: [Buildroot] [PATCH v3] uboot-tools: bump to version 2014.04
In-Reply-To: <1398840891-19524-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Wed, 30 Apr 2014 10:54:51 +0400")
References: <1398840891-19524-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87tx8w6kjs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > U-Boot v2014.04 introduced significant changes in its build infrastrcture.
 > Among things related to buildroot are:
 > 1. Special new target ("tools-only") was added for building host tools alone

 > 2. Tools cross-building for target is no longer possible with substitution of
 > HOSTxx with TARGETxx because host binaries won't be built. Instead we just set
 > CROSS_COMPILE and CROSS_BUILD_TOOLS variables.

 > 3. Most of make targets now require U-Boot to be configured before building.
 > So for building generic "fw_printenv" we now need to make "env" target config-
 > independent.

 > 4. HOSTCPPFLAGS are only applicable to .cpp files so dropping
 > "uboot-tools-02-hostcflags-override-fix.patch"

 > Also due to lincese boilerplate change in sources
 > "uboot-tools-01-drop-configh-from-tools.patch" required subtle changes.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---

 > Changes compared to v2:
 >  * Added verbose commit message
 >  * Reverted meaningful comment in "uboot-tools-02-hostcflags-override-fix.patch"

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
