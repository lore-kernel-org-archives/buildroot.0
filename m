From: Herve Codina <herve.codina@bootlin.com>
Date: Fri, 25 Jun 2021 10:22:24 +0200
Subject: [Buildroot] [PATCH 10/15] package/pkg-generic.mk: Move python
 fixup to generic package infrastructure
In-Reply-To: <20210622210103.GN44262@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-11-herve.codina@bootlin.com>
 <20210622210103.GN44262@scaer>
Message-ID: <20210625102224.0da0e727@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 22 Jun 2021 23:01:03 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> So, earlier in the series, you introduced _PER_PACKAGE_TWEAK_HOOKS (or
> whatever the name it will eventually bear), stating that infras could
> set it, but here  you are not taking the chance to demonstrate this,
> and instead you are inserting the python fixups in an ad-hoc way.
> 
> Which also illustrates that the libtool fixups should be converted to
> the _PER_PACKAGE_TWEAK_HOOKS, probably...
> 

Yes that's perfectly true.

But do you think we need it right now in this patch series.
I really would prefer to keep it as it is for this patch series.

The series is already quite complex and I think that converting
libtool and python fixups to PER_PACKAGE_TWEAK_HOOKS (or other name)
can be done afterward.

Herve

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
