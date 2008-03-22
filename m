From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Mar 2008 13:19:02 +0100
Subject: [Buildroot] [PATCH] Add thumb support to buildroot for the ARM
 architecture
In-Reply-To: <59110.195.222.79.169.1206184018.squirrel@webmail.promwad.com>
References: <20080312090846.2cfecec8@crazy> <20080314090331.11f1bddc@crazy>
	<47DA7E94.2070302@promwad.com> <20080314141929.006a424d@crazy>
	<20080314145655.3c119daa@crazy>
	<59110.195.222.79.169.1206184018.squirrel@webmail.promwad.com>
Message-ID: <20080322131902.1b4a74bf@crazy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 22 Mar 2008 13:06:58 +0200 (EET),
"Ivan Kuten" <ivan.kuten@promwad.com> a ?crit :

> I compiled for ARM_920T & EABI & SOFTFLOAT.
> I checked busybox binary ( arm-linux-objdump ) - there is no blx
> instruction. Seems all these ARM troubles were related to avr32
> patches (see recent posts in mailing list) because yesterday finally
> I managed to build working rootfs.

Hum, maybe.

> However busybox binary seems resulted in OABI format because when
> in kernel disable OABI_COMPAT - rootfs does not boot.

Do you have CONFIG_EABI=y in your buildroot config file ?

But anyway, do you confirm that my patch works ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Free Embedded Linux Training Materials
on http://free-electrons.com/training
(More than 1500 pages!)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080322/17173df4/attachment.pgp 
