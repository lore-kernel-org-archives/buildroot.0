From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 21:18:21 +0100
Subject: [Buildroot] [PATCH] wine: Bump to version 1.8.1
In-Reply-To: <56B627C8.5020506@dawncrow.de>
References: <56B627C8.5020506@dawncrow.de>
Message-ID: <20160206211821.30144422@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Sat, 6 Feb 2016 18:05:12 +0100, Andr? Hentschel wrote:
> Bumping to stable version 1.8.1
> 
> Upstreamed patch is finally dropped.

So we should be able to drop WINE_AUTORECONF = YES from wine.mk. Can
you verify this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
