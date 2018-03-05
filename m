From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Mar 2018 08:57:51 +0100
Subject: [Buildroot] Defconfigs failing to build with gcc 6.x
In-Reply-To: <CAOMZO5DXmGWSbfE9PEp+srYkM8ieMX0NYOmyOgza0cuSHsjr9A@mail.gmail.com>
References: <20180304224808.566fa00d@windsurf.home>
 <CAOMZO5DXmGWSbfE9PEp+srYkM8ieMX0NYOmyOgza0cuSHsjr9A@mail.gmail.com>
Message-ID: <20180305085751.1b03854f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Mar 2018 20:29:27 -0300, Fabio Estevam wrote:

> >  - freescale_p1010rdb_pa_defconfig
> >
> >    https://gitlab.com/buildroot.org/buildroot/-/jobs/55306827
> >
> >    Gustavo was taking care of this board. I'm adding Fabio (Estevam)
> >    from Freescale/NXP as a replacement, in case he is
> >    interested. Fabio (Estevam): let me know if you're interested. If
> >    not, we'll remove this defconfig.  
> 
> I don't have access to this board, but I can try to bump the kernel to
> 4.15.7 and see if it builds fine.

If you don't have access to this board, and nobody else does, isn't it
better to simply drop the defconfig ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
