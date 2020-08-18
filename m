From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 18 Aug 2020 16:47:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/thermald: disable werror
In-Reply-To: <20200818164003.4a89e241@windsurf.home>
References: <20200817183612.2826191-1-fontaine.fabrice@gmail.com>
 <20200817183612.2826191-2-fontaine.fabrice@gmail.com>
 <20200818164003.4a89e241@windsurf.home>
Message-ID: <CAPi7W81dt63=ADrSpzzTQi1CkYp2DN1JB=Jf0PcgHM_5cQbreQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 18 ao?t 2020 ? 16:40, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Mon, 17 Aug 2020 20:36:12 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/80a126c225a9e9cbfdc30882c4ce00517d853d8b
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ....ac-allow-the-user-to-disable-Werror.patch | 51 +++++++++++++++++++
> >  package/thermald/thermald.mk                  |  1 +
> >  2 files changed, 52 insertions(+)
> >  create mode 100644 package/thermald/0001-configure.ac-allow-the-user-to-disable-Werror.patch
>
> Is there a reason why this patch (fixing an autobuilder issue) is PATCH
> 2/2 and not PATCH 1/2 ?
>
> Indeed, we normally want to fix existing issues before bumping the
> version, as fixes currently go to master, while version bumps go to
> next.
>
> Could you clarify ?
Because, the patch fixing the build failure does not apply cleanly on
current version.
So, instead of backporting my patch, I thought it would be easier to
bump to the latest official release.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
