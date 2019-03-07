From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 7 Mar 2019 22:41:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/flashrom: disable on arc,
 nios and or1k
In-Reply-To: <20190307223605.0b916083@windsurf>
References: <20190307213431.17211-1-fontaine.fabrice@gmail.com>
 <20190307223605.0b916083@windsurf>
Message-ID: <CAPi7W8269ViDpmXyq-x+h6oJGx=Q1VRVbOfdz6fm=O4NNBuvSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le jeu. 7 mars 2019 ? 22:36, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Thu,  7 Mar 2019 22:34:31 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/22c72369cd5b7a8200bb03564bdc342ed026ccac
> >  - http://autobuild.buildroot.org/results/ef6869bc40382145fad1079b79107275c4973494
> >  - http://autobuild.buildroot.org/results/09d857102c469ede1db0bff8aa0dcd82a4001eaf
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Should we turn this around, and use:
>
> config BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS
>         bool
>         default y if ...
>         default y if ...
>
> etc. ?
OK, I'll send a v2.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
