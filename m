From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 22:19:15 +0200
Subject: [Buildroot] [PATCH 1/2] uboot and arm trusted firmware build
 added to juno board
In-Reply-To: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
References: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
Message-ID: <20160426221915.2651d4b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Apr 2016 17:35:55 +0100, Joao Pinto wrote:

> +    +-- u-boot.bin
> +    +-- bl1.bin
> +    +-- bl2.bin
> +    +-- bl2u.bin
> +    +-- bl31.bin
> +    +-- fip.bin

Looking at your atfirmware package, I see bl1.bin and fip.bin being
copied to output/images, but not bl2.bin, bl2u.bin and bl31.bin. Why
are you mentioning them here?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
