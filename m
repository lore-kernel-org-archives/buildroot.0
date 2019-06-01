From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 1 Jun 2019 12:57:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: fix build with musl
In-Reply-To: <20190601123702.39c6ab74@windsurf>
References: <20190528191704.25405-1-fontaine.fabrice@gmail.com>
 <20190601123702.39c6ab74@windsurf>
Message-ID: <CAPi7W80=4=Hbu-ztXAXHtobLpdcn1iPKZmcDEer=qBsD3ViT+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le sam. 1 juin 2019 ? 12:37, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Tue, 28 May 2019 21:17:04 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/c703d45ab691641beabc3440f081a8bc195b4a23
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  .../wpewebkit/0001-Fix-build-with-musl.patch  | 79 +++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >  create mode 100644 package/wpewebkit/0001-Fix-build-with-musl.patch
>
> Applied to master, thanks. Was this submitted upstream ?
Done : https://github.com/WebPlatformForEmbedded/WPEWebKit/pull/606
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
