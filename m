From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Mar 2014 21:50:08 +0100
Subject: [Buildroot] [PATCH 05/11] clapack: new package
In-Reply-To: <CAHXCMMLNy_hLiw3dk+efGvmsCmDVzkQu4nuT3F_PneXhQoBgEQ@mail.gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-6-git-send-email-s.martin49@gmail.com>
 <20140306193055.GE3625@free.fr> <20140306194208.GF3625@free.fr>
 <CAHXCMMLNy_hLiw3dk+efGvmsCmDVzkQu4nuT3F_PneXhQoBgEQ@mail.gmail.com>
Message-ID: <20140306205008.GG3625@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-06 21:16 +0100, Samuel Martin spake thusly:
> On Thu, Mar 6, 2014 at 8:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Samuel, All,
> >
> > On 2014-03-06 20:30 +0100, Yann E. MORIN spake thusly:
> >> On 2014-02-16 22:59 +0100, Samuel Martin spake thusly:
> >> > This package provides BLAS and LAPACK libraries.
> > [--SNIP--]
> >> > diff --git a/package/clapack/clapack.mk b/package/clapack/clapack.mk
> >> > new file mode 100644
> >> > index 0000000..d8ca3be
> >> > --- /dev/null
> >> > +++ b/package/clapack/clapack.mk
> >> > @@ -0,0 +1,20 @@
> >> > +################################################################################
> >> > +#
> >> > +# clapack
> >> > +#
> >> > +################################################################################
> >> > +
> >> > +CLAPACK_VERSION = 3.2.1
> >> > +CLAPACK_SOURCE = clapack-$(CLAPACK_VERSION)-CMAKE.tgz
> >>
> >> What the difference between this ^^^^ and clapack-3.2.1.tgz at the same site:
> >>     http://www.netlib.org/clapack/clapack-3.2.1.tgz
> >
> > Why don't we use the non-cmake tarball?
> 
> Because I prefer/know better/am more confident in hacking CMake code
> than handwritten makefiles.
> So, I chose what is easier to me to maintain. Is it a valid argument? ;-)

Yes, of course! I expected you'd say that. ;-)

> > If the non-cmake *and* the build-system in there is flexible enough,
> > that would allow us to not carry patches against the cmake build system.
> 
> I have to admit I have not even tried (and sorry, I don't really feel
> like trying it).

Yes, sure. I had to ask. ;-)

But if possible, try to push those changes upstream.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
