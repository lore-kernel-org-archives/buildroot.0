From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2020 20:26:49 +0200
Subject: [Buildroot] [PATCH] boot/afboot-stm32: fix build with gcc 10
In-Reply-To: <20200910094608.1251382-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 10 Sep 2020 11:46:08 +0200")
References: <20200910094608.1251382-1-thomas.petazzoni@bootlin.com>
Message-ID: <87d02t5vyu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit adds a patch that passes -fno-builtin to fix the build
 > with gcc 10. The patch has been submitted upstream.

 > There are no autobuilder failures, since it's a bootloader package,
 > and therefore not tested by the autobuilders. However, a build failure
 > was detected when building toolchains and a minimal ARMv7-M system at
 > https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359529.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
