From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Oct 2019 08:54:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: fix static build
 with openssl
In-Reply-To: <CAPi7W81sWZ2yD00gnaBA+VV6vviNXc5zn8GsvFiTves0+ckTuQ@mail.gmail.com>
References: <20191016204128.27360-1-fontaine.fabrice@gmail.com>
 <20191016224816.3ed0e602@windsurf.home>
 <CAPi7W804=Ba=kUBRQ7EhZuKf=ypAnyaPoWFMXv1F6EzLw=fqng@mail.gmail.com>
 <20191016231008.41fa8287@windsurf.home>
 <CAPi7W81sWZ2yD00gnaBA+VV6vviNXc5zn8GsvFiTves0+ckTuQ@mail.gmail.com>
Message-ID: <20191018085411.61f0da4e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Oct 2019 18:57:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Then:
> >
> >         find_package(PkgConfig QUIET)
> >         if(whatever is the right way to check if pkg-config was found)
> >           pkg_check_modules(PC_OPENSSL openssl QUIET)
> >           ... adjust LIBS/CFLAGS ...
> >         else()
> >           find_package(OpenSSL REQUIRED)
> >         endif()  
> Upstream merged the patch as is, should I sent them a new PR with your updates?

If upstream was happy with your patch as-is, I'm fine with it :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
