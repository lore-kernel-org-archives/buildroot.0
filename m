From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 19 Mar 2008 22:45:18 +0100
Subject: [Buildroot] updating package/mtd
References: <20080318063516.GA607@cloud.net.au>
Message-ID: <048001c88a0a$8a2696f0$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> I'm going to update package/mtd to support a newer version, because I
> need access to ubi and other new tools.
> 
> Using the MTD snapshot version seems to be broken - there are no
> snapshots on the ftp.uk.linux.org server any more. Also I think we could
> merge the makefiles for the 2005* and 2006* versions.
> 
> Any comments, thoughts, objections, requests?
> 
> thanks
> Hamish
> -- 


If you want to work on this, you need to test the result on AT45 dataflash.
Unless you have access to such a target, I suggest you leave the 2006 support there
and add yet another version.

Best Regards
Ulf Samuelsson
