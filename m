From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Jul 2017 12:35:29 +0200
Subject: [Buildroot] [PATCH] support/testing: fix TestExt4 after ext2fs
 refactoring
In-Reply-To: <5969864f1120e_a571321b20566b5@ultri3.mail>
References: <20170710214531.15758-1-arnout@mind.be>
 <5969864f1120e_a571321b20566b5@ultri3.mail>
Message-ID: <20170715103529.GB3095@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, Arnout, All,

On 2017-07-15 00:04 -0300, Ricardo Martincoski spake thusly:
> On Mon, Jul 10, 2017 at 06:45 PM, Arnout Vandecappelle (Essensium/Mind) wrote:
> 
> > Commit bee9e881a2d3addd6880b39f3e33a7180d0b1eb4 removed the
> > BR2_TARGET_ROOTFS_EXT2_BLOCKS but didn't update TestExt4 that uses
> > (tests) that option.
> > 
> > Convert it to BR2_TARGET_ROOTFS_EXT2_SIZE, using 16M so the M gets
> > tested as well.
> 
> http://patchwork.ozlabs.org/patch/788595/
> that does not use the M, was applied instead.

Oh, sorry Aernout, I did not notice your patch before sending mine...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
