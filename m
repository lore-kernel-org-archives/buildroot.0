From: Sven Neumann <s.neumann@phase-zero.de>
Date: Thu, 29 Jan 2009 16:30:53 +0100
Subject: [Buildroot] meaning of BR2_arm_dunno
Message-ID: <1233243053.15375.33.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I wonder if anyone could explain to me the purpose of BR2_arm_dunno as
used in target/Config.in.arch. The reason I am asking is that we've run
into the problem of ending up with a misconfigured gcc (as reported
earlier on this list). I would like to find out how this can be avoided
in the future, but I seem to be unable to understand the mechanism that
selects the default values for BR2_GCC_TARGET_TUNE, BR2_GCC_TARGET_ARCH
and BR2_GCC_TARGET_ABI.


Sven
