From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:27:38 +0200
Subject: [Buildroot] [PATCH 1/1] support/script/check-bin-arch: ignore
 /usr/lib/grub
In-Reply-To: <20170816173935.2361-1-andrewpilloud@igneoussystems.com>
References: <20170816173935.2361-1-andrewpilloud@igneoussystems.com>
Message-ID: <20170816232738.69c2c142@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Aug 2017 10:39:35 -0700, Andrew Pilloud wrote:
> /usr/lib/grub may contain binaries for the grub bootloader. These
> ELF binaries may be for other platforms.
> 
> Signed-off-by: Andrew Pilloud <andrewpilloud@igneoussystems.com>

I've built both grub and grub2, and I don't get anything installed
in /usr/lib/grub. Could you give more details on how you get binaries
installed in /usr/lib/grub ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
