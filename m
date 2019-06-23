From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:46:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/xorgproto: enable legacy
In-Reply-To: <20190623081342.6098-1-fontaine.fabrice@gmail.com>
References: <20190623081342.6098-1-fontaine.fabrice@gmail.com>
Message-ID: <20190623124642.2186a8b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, Bernd,

On Sun, 23 Jun 2019 10:13:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> xproxymngproto is needed by xfindproxy but it is now disabled by default
> Enable it thanks to --enable-legacy
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4b21400c36e8ba7a8222f9da962f79e42c6146d3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/x11r7/xorgproto/xorgproto.mk | 2 ++
>  1 file changed, 2 insertions(+)

I've applied to master, as your patch is the most direct solution for
the build issue. However, if this protocol is now considered legacy,
perhaps we should simply drop the xfindproxy package ? I doubt it is
used at all...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
