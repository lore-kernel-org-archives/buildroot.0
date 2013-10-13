From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
Date: Sun, 13 Oct 2013 15:50:32 +0200
Subject: [Buildroot] [PATCH] toolchain-external: add a specific check to
 avoid Angstrom toolchains
In-Reply-To: <20131013154106.0f3c049d@skate>
References: <1381572882-22592-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131013124803.2044e4c3@e6520eb> <20131013154106.0f3c049d@skate>
Message-ID: <20131013155032.7f390d4b@e6520eb>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 13 Oct 2013 15:41:06 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Dear Eric B?nard,
> 
> On Sun, 13 Oct 2013 12:48:03 +0200, Eric B?nard wrote:
> 
> > Le Sat, 12 Oct 2013 12:14:42 +0200,
> > Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
> > > To avoid this problem in the future, we explicitly check if the
> > > toolchain is from Angstrom by looking at the vendor part of the tuple
> > > exposed by the toolchain: as soon as it is
> > > <something>-angstrom-<something-else>, we reject the toolchain with an
> > > explanation.
> > > 
> > maybe you should also check for at least "oe" and "poky" as these are
> > the vendor part of toolchains generated with plain OE-Core or
> > Yocto/Poky.
> 
> Hum, right. Are those available in the form of tarballs, like the
> angstrom toolchain available at
> http://www.angstrom-distribution.org/toolchains/ ? I know you can
> generate such tarballs with OE or Yocto, but unless these tarballs are
> available pre-built on the web, I guess it's pretty unlikely that such
> toolchains get used as external toolchains in Buildroot.
> 
http://downloads.yoctoproject.org/releases/yocto/yocto-1.4/toolchain/

Eric
