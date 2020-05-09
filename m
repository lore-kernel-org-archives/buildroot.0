From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 9 May 2020 16:08:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtdev2tuio: fix build with musl
 1.2.0
In-Reply-To: <5e59a307-054c-5eed-97d4-96a46d312089@relinux.de>
References: <20200425104816.1229406-1-fontaine.fabrice@gmail.com>
 <20200425221618.67ddb474@windsurf.home>
 <5e59a307-054c-5eed-97d4-96a46d312089@relinux.de>
Message-ID: <CAPi7W81nTpONcC8u9RUQ3vo=ZPP9WdSCAG-0sFR_Z7bVsDOnYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephan,

Le sam. 9 mai 2020 ? 14:58, Stephan Hoffmann <sho@relinux.de> a ?crit :
>
> Hello Thomas, Fabrice,
>
> once upon a time I added mtdev2tuio because at the time it was useful in
> multitouch szenarios. I do not use it any more.
>
> @Fabrice: Since you seems to have adopted mtdev2tuio, do you use it? If
> yes, could you please put yourself in the developer list instead of me?
>
> If not, I could volunteer to remove it since it is not maintained and it
> breaks builds every now and then.
You can remove it, I don't use mtdev2tuio.
>
> Kind regards
>
> Stephan
>
> Am 25.04.20 um 22:16 schrieb Thomas Petazzoni:
> > On Sat, 25 Apr 2020 12:48:16 +0200
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> >> Fixes:
> >>  - http://autobuild.buildroot.org/results/a30823f1388f37820d8a4f29b9b2c1de9b3992ac
> >>
> >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >> ---
> >>  ...dev2tuio.c-fix-build-with-musl-1.2.0.patch | 57 +++++++++++++++++++
> >>  1 file changed, 57 insertions(+)
> >>  create mode 100644 package/mtdev2tuio/0002-mtdev2tuio.c-fix-build-with-musl-1.2.0.patch
> > Applied to master, thanks. However, this project hasn't seen any commit
> > since 2012. Is it still relevant/useful ?
> >
> > Thomas
Best Regards,

Fabrice
