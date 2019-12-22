From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 22 Dec 2019 12:00:00 +0100
Subject: [Buildroot] [PATCH] package/open2300: add hash file
In-Reply-To: <20191222105754.188b7bd2@windsurf>
References: <20191222083707.3448-1-heiko.thiery@gmail.com>
 <20191222105754.188b7bd2@windsurf>
Message-ID: <CAEyMn7an_j9Uwh-6SKSz6R6ekDMkH4QJavexEeEWGQGW=tEx5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 22. Dez. 2019 um 10:57 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Sun, 22 Dec 2019 09:37:08 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > - add sha256 tarball hash
> > - add sha256 license hash
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  package/open2300/open2300.hash | 2 ++
> >  1 file changed, 2 insertions(+)
> >  create mode 100644 package/open2300/open2300.hash
> >
> > diff --git a/package/open2300/open2300.hash b/package/open2300/open2300.hash
> > new file mode 100644
> > index 0000000000..913cccf4d2
> > --- /dev/null
> > +++ b/package/open2300/open2300.hash
> > @@ -0,0 +1,2 @@
>
> We need a comment at the top of the file that says where the hashes come from.

is a simple "# Locally generated" ok?

I will update the patch.

> > +sha256       f4239d2f16d52156586d06be38f06a3eb58168377e243a8de8720b66e33ddb8f  open2300-12.tar.gz
>
> The source code for this package is fetched from Subversion. Are the
> tarballs we create out of SVN repositories reproducible ? I guess so,
> but let's loop in Yann Morin for some additional feedback on this.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
