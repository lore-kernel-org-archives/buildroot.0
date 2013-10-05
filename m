From: Fatih =?utf-8?B?QcWfxLFjxLE=?= <fatih.asici@gmail.com>
Date: Sat, 05 Oct 2013 10:53:33 +0300
Subject: [Buildroot] [PATCHv2] beaglebone: add BeagleBone Black support
In-Reply-To: <878uy9jb7r.fsf@dell.be.48ers.dk>
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 <A20C6CC8-715F-45C3-BB9F-5085269FFD13@ti.com>
 <878uy9jb7r.fsf@dell.be.48ers.dk>
Message-ID: <4620256.4JgqIslJcA@asici>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 04 October 2013 17:40:40 Peter Korsgaard wrote:
>  Jason> I will keep it however you'd like. The important part is the
> kernel. 
> 
> I would like to keep it with ext2 just to keep it similar to the other
> defconfigs. Then we also don't need to carry the u-boot patch.

A patch is still needed since the default am335x_evm (also omap[45]) config 
changes "bootdir" to "/boot" unlike the other u-boot configs. I don't have an 
idea about the other options; but at least this change is needed for a 
familiar experience with other boards.
