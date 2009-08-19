From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 19 Aug 2009 16:19:35 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090819214237.534c433f@surf>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com>
	<20090819214237.534c433f@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, August 19, 2009 12:43 PM, Thomas Petazzoni wrote:
>> I haven't been able to figure out what the problem is.  Does anyone
>> have an idea?  I'm using buildroot version 2009.08-rc2 and kernel
>> 2.6.30.5 if that's any help.
>
> Do you compile your kernel with Buildroot, or do you compile it
> manually ? If compiled manually, is CONFIG_AEABI enabled in your kernel
> configuration ?

The kernel and rootfs are both created with Buildroot.

For the kernel config I have:

CONFIG_AEABI=y
CONFIG_OABI_COMPAT=y

For buildroot's config I have:

# BR2_ARM_OABI is not set
BR2_ARM_EABI=y

Is there a similar configuration that needs to be set in Busybox?

Regards,
Hartley
