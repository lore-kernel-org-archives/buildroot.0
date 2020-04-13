From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 09:53:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/mc: fix typo in gpm dependency
In-Reply-To: <20200413065616.20674-1-bernd.kuhls@t-online.de>
References: <20200413065616.20674-1-bernd.kuhls@t-online.de>
Message-ID: <20200413095344.297c1f0b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Apr 2020 08:56:16 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/3c9/3c9eb8a0db26770e69d47eee70100a556dd130b3/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mc/mc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gah, sorry, I have also seen the issue in the autobuilders before
looking at the backlog of patches, so I pushed my patch first. Sorry
about that :/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
