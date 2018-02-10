From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 16:13:42 +0100
Subject: [Buildroot] [PATCH] package/efl: add in-tree eina library path
In-Reply-To: <2d5d47ac-c522-3640-5122-86adc82b3e3f@mind.be>
References: <20180206082114.3434-1-romain.naour@gmail.com>
 <2d5d47ac-c522-3640-5122-86adc82b3e3f@mind.be>
Message-ID: <20180210161342.173daa34@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 6 Feb 2018 23:26:58 +0100, Arnout Vandecappelle wrote:

> > There is an issue while rebuilding host-efl, elua is stuck at 100% cpu
> > for some reason...  
> 
>  I meant to ask you life, but forgot:
> 
>  Do you mean this problem occurs before or after this patch or both? Or do you
> mean: when I reproduce the autobuild failure and then do "make host-efl-rebuild"
> after changing something, elua is stuck at 100% cpu?

If I remember correctly the discussion I had with Romain, his patch
fixes the build issue of the autobuilder, but there is a 100% CPU
consumption problem when doing a rebuild (which wouldn't be caught by
the autobuilders, because we don't do rebuilds).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
