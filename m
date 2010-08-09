From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Mon, 09 Aug 2010 09:16:46 +0200
Subject: [Buildroot] kernel header patches
In-Reply-To: <4C5BF511.8070704@gmx.net>
References: <4C567B5D.70600@fh-kl.de> <4C5BF511.8070704@gmx.net>
Message-ID: <4C5FAB5E.1090901@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Ossy schrieb:
> Am 02.08.2010 10:01, schrieb Patrick Ziegler:
>>
>> Is there an official way to apply patches to the kernel headers and
>> kernel sources depending on the board ?
>>
> For my Board I need to apply some minor patches to the kernel. My
> configuration looks like this:
>
> Location of patches in project tree:
> target/device/sheevaplug/SeagateDockStar/kernel-patches/
> -> linux-2.6.34-0001-ABC.patch
> -> linux-2.6.34-0002-XYZ.patch
> -> DONOTUSENOW-linux-2.6.34-0002-XYZTesting.patch
>
> .config includes:
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="target/device/sheevaplug/SeagateDockStar/SeagateDockStar-linux-2.6.34.1.config"
>
> BR2_LINUX_KERNEL_PATCH="target/device/sheevaplug/SeagateDockStar/kernel-patches/"
>
>
> The patches were correctly applied during kernel compilation via
> buildroot.

Thanks, but unfortunately this works only for the kernel compilation not
for the kernel headers.

-- 

Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:	+49 6332 914 526
Mail:	patrick.ziegler at fh-kl.de

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
