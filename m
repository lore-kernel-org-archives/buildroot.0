From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 26 Jan 2009 14:40:12 +0100
Subject: [Buildroot] Error encountered while doing make after adding
 u-boot
In-Reply-To: <8ebba8c20901260506t271f675avd114aefdf82be711@mail.gmail.com>
References: <8ebba8c20901260506t271f675avd114aefdf82be711@mail.gmail.com>
Message-ID: <20090126144012.4e62179b@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 26 Jan 2009 18:36:16 +0530
Mitesh Gupta <guptamitesh@gmail.com> wrote:

<snipp>

> make[1]: Entering directory
> `/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10'
> make[1]: *** No rule to make target `_config'.  Stop.

You need to set the variable BR2_TARGET_UBOOT_BOARDNAME.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
