From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 May 2019 21:30:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5serialbus: disable on
 microblaze
In-Reply-To: <20190514191853.27536a03@windsurf>
References: <20190514171058.22604-1-fontaine.fabrice@gmail.com>
 <20190514191853.27536a03@windsurf>
Message-ID: <CAPi7W80rG2eUPp1TVXT9GyxA1Y72R4R4nJTaUQcm2+00DXRfPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le mar. 14 mai 2019 ? 19:18, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Tue, 14 May 2019 19:10:58 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/3482bd950c7ab5608666807a7ab7ea857c767333
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Does the failure happen with gcc 8.x ? With gcc 9.x ?
I tested with s6lx9_microboard_defconfig and gcc 8.x and the build was
successful, I'll send a v2 to disable it only with gcc <= 7.
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
