From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 7 Jun 2019 14:10:04 +0530
Subject: [Buildroot] [PATCH v2 2/3] autobuild-run: initial
 implementation of do_reproducible_build()
In-Reply-To: <20190607103338.0431cf9e@windsurf>
References: <20190607064657.3571-1-itsatharva@gmail.com>
 <20190607064657.3571-2-itsatharva@gmail.com>
 <20190607103338.0431cf9e@windsurf>
Message-ID: <CABM+sgozFtkt7Q9pKGpDf2jeFL3dw4s95VrEpBVgb9uC876MPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> But perhaps this is something that is planned to do in a second step,
> and you want to make progress with a simpler initial solution ?

Precisely. Varying the build location is planned for the second step.

Regards,
Atharva Lele


On Fri, Jun 7, 2019 at 2:03 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Fri,  7 Jun 2019 12:16:56 +0530
> Atharva Lele <itsatharva@gmail.com> wrote:
>
> > This new function will call do_build() twice to produce two builds
> > and then check their reproducibility
> >
> > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
>
> So, if I read the implementation correctly, in this first step, we
> build twice in the same output path, i.e the only variation between the
> first and the second build is the time at which the build takes place.
>
> We discussed on IRC that we could easily also change the output path
> (i.e build location) between the first and second build. But perhaps
> this is something that is planned to do in a second step, and you want
> to make progress with a simpler initial solution ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190607/e295ab52/attachment.html>
