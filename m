From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 29 Jan 2009 10:42:08 +0100
Subject: [Buildroot] svn commit:
 trunk/buildroot/target/device/Atmel/arch-avr32: kernel-patches-2.6.28.2
In-Reply-To: <20090129093246.EBDF27741D@busybox.osuosl.org>
References: <20090129093246.EBDF27741D@busybox.osuosl.org>
Message-ID: <20090129104208.2a2c38c8@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Jan 2009 09:32:46 +0000 (UTC)
ulf at uclibc.org wrote:

> Author: ulf
> Date: 2009-01-29 09:32:45 +0000 (Thu, 29 Jan 2009)
> New Revision: 25113
> 
> Log:
> Add AVR32 support for linux-2.6.28.2
> 

I appreciate the effort for these patches.

> Added:
>    trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/
>    trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-100-avr32-atmel.1.patch

But do not make something that looks like a vendor release, this is
AFAIK not tested. Is this just a rebase?

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
