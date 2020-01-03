From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 3 Jan 2020 17:29:02 +0100
Subject: [Buildroot] [PATCH 04/11] support/scripts/pkg-stats: do not
 exclued pkg name in json output
In-Reply-To: <20200103162456.4167ad5d@windsurf>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-5-heiko.thiery@gmail.com>
 <20200103162456.4167ad5d@windsurf>
Message-ID: <CAEyMn7b6EcvAKcG4nQoTAMeSLPExUTA4W-Y6jxnG7uip_qk_xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fr., 3. Jan. 2020 um 16:24 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Fri,  3 Jan 2020 16:18:41 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> But isn't the package name already present in
> http://autobuild.buildroot.net/stats/index.json ? All the subnodes of
> /packages/ are nodes named after the packages.

When handling a package node I dont have the knowledge of the name. Or
I have to passing the name also to the render function:
https://github.com/hthiery/buildroot-stats/blob/master/app/routes.py#L67

This is also possible. But I thought it is a good idea to do so.

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
