From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jul 2014 00:08:26 +0200
Subject: [Buildroot] [PATCH] qemu/mips64-malta: update defconfig to
 Linux 3.15.x
In-Reply-To: <53CD7A09.5040608@zacarias.com.ar>
References: <20140721201340.GA31551@waldemar-brodkorb.de>
 <20140721223512.2207d08c@free-electrons.com>
 <53CD7A09.5040608@zacarias.com.ar>
Message-ID: <20140722000826.05422f03@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, Waldemar,

On Mon, 21 Jul 2014 17:37:29 -0300, Gustavo Zacarias wrote:

> > Well, actually, Buildroot can generate ext3 and ext4 filesystems:
> > http://git.buildroot.net/buildroot/tree/fs/ext2/Config.in#n13.
> 
> And there's also CONFIG_EXT4_USE_FOR_EXT23 for the kernel side, which
> makes the EXT4 option in the kernel cover all use cases.

So maybe, Waldemar, could you respin with CONFIG_EXT4 +
CONFIG_EXT4_USE_FOR_EXT23 ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
