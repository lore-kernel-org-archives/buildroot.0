From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 15 Dec 2009 08:18:09 +0100
Subject: [Buildroot] [PATCH 05/23] uclibc: add avr32 special version
In-Reply-To: <3a24927a0e6f041a018085b5a7fc50312001fddc.1260831891.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
	<3a24927a0e6f041a018085b5a7fc50312001fddc.1260831891.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20091215081809.071a009e@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Dec 2009 00:04:37 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> 
>  * Add a new 0.9.30-avr32-2.1.5 version of uClibc in Config.in
>

Huh? That version does not exist... Please just use the upstream
release.

>  * Add a patch for 0.9.20-avr32-2.1.5
>

This patch 'uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch' does not
sound AVR32 specific to me. You only need one uClibc patch from an
AVR32 point of view, the "fix-varargs-in-prctl-syscall.patch"

>  * Select a different UCLIBC_SITE for avr32 versions in uclibc.mk
>
>  * Add the LINKRELAX=y configuration option to the uClibc .config file
>    in uclibc.mk
>

Good, does the generic uClibc configuration enable optimized string
functions?

-- 
Best regards,
Hans-Christian Egtvedt
