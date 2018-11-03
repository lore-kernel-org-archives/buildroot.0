From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 14:28:36 +0100
Subject: [Buildroot] [PATCH] package/bdwgc: drop AUTORECONF = YES
In-Reply-To: <20181102203338.23534-1-thomas.petazzoni@bootlin.com>
References: <20181102203338.23534-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181103142836.54e2a39e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Nov 2018 21:33:38 +0100, Thomas Petazzoni wrote:
> Since commit 4e1dbd063d1f3ea7dfc95698320f6fd40139085d ("package/bdwgc:
> bump to version 8.0.0"), we no longer have any patch that requires
> autoreconf. In addition, the libtool shipped with the package seems to
> no longer be bogus, because it builds perfectly fine without
> autoreconf. Therefore, let's drop this autoreconf.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/bdwgc/bdwgc.mk | 6 ------
>  1 file changed, 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
