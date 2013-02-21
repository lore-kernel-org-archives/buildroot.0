From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 21:24:06 +0100
Subject: [Buildroot] [PATCH 11/13] libshairport: new package
In-Reply-To: <CAHXCMMJ+gu3e0hemH2JCn-_xoJbR_Fh7LML1yYriWZzgmdYtzQ@mail.gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <b0b591df9513c8714c641b591d64591e38dc554f.1361458625.git.maxime.hadjinlian@gmail.com>
 <CAHXCMMJ+gu3e0hemH2JCn-_xoJbR_Fh7LML1yYriWZzgmdYtzQ@mail.gmail.com>
Message-ID: <201302212124.06791.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, Samuel, All,

On Thursday 21 February 2013 Samuel Martin wrote:
> 2013/2/21 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>:
> > libshairport is a client library that emulates an airplay server
> > This package was originally found at : https://github.com/huceke/buildroot-rbp
> > By gimli <ebsi4711@gmail.com>
> [...]
> > diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch b/package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch
> > new file mode 100644
> > index 0000000..b2debed
> > --- /dev/null
> > +++ b/package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch
> > @@ -0,0 +1,270 @@
> > +diff -uP libshairport-1.2.0.20310_lib/src/ao.h ../../../../../libshairport-1.2.0.20310_lib/src/ao.h
> > +--- libshairport-1.2.0.20310_lib-org/src/ao.h  1970-01-01 01:00:00.000000000 +0100
> > ++++ libshairport-1.2.0.20310_lib-mod/src/ao.h  2011-09-25 20:36:36.000000000 +0200
> 
> I guess you get the patches from the web?
> 
> Could you reformat the patches' header according to:
> http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
> and/or:
> http://buildroot.org/downloads/manual/manual.html#_integrating_patches_found_on_the_web

Or better yet, grab them from the net with
    LIBSHAIRPORT_PATCH = http://path/to/patch-1  \
                         http://path/to/patch-2  \
                         http://path/to/patch-3

> [...]
> > +LIBSHAIRPORT_VERSION = 1.2.0.20310_lib
> > +LIBSHAIRPORT_SITE = http://mirrors.xbmc.org/build-deps/darwin-libs
> > +LIBSHAIRPORT_INSTALL_STAGING = YES
> > +LIBSHAIRPORT_AUTORECONF = YES
> A short comment why autoreconf is necessary would be appreciated.

And add the license. It looks like it is an MIT (or MIT-like) license,
as it is very similar to that:
    https://spdx.org/licenses/MIT

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
