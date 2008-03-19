From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 20 Mar 2008 10:49:18 +1100
Subject: [Buildroot] updating package/mtd
In-Reply-To: <048001c88a0a$8a2696f0$070514ac@atmel.com>
References: <20080318063516.GA607@cloud.net.au>
	<048001c88a0a$8a2696f0$070514ac@atmel.com>
Message-ID: <20080319234917.GC17292@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 19, 2008 at 10:45:18PM +0100, Ulf Samuelsson wrote:
> 
> 
> > I'm going to update package/mtd to support a newer version, because I
> > need access to ubi and other new tools.
> > 
> > Using the MTD snapshot version seems to be broken - there are no
> > snapshots on the ftp.uk.linux.org server any more. Also I think we could
> > merge the makefiles for the 2005* and 2006* versions.
> > 
> > Any comments, thoughts, objections, requests?
> 
> If you want to work on this, you need to test the result on AT45 dataflash.
> Unless you have access to such a target, I suggest you leave the 2006 support there
> and add yet another version.

OK. Is AT45 dataflash not working in the current git version, or 1.1.0?
Do we need the 2005* version as well, and also the 1.1.0 release which
is the latest of the 3 current working options?

I need something from git myself to get access to the ubi tools.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
