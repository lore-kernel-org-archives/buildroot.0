From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 22:26:29 +0100
Subject: [Buildroot] [PATCH 1/2] package/ltp-testsuite: Backport 3 more
 musl related patches
In-Reply-To: <20191120171401.14663-1-petr.vorel@gmail.com>
References: <20191120171401.14663-1-petr.vorel@gmail.com>
Message-ID: <20191120222629.6cf9f2d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Nov 2019 18:14:00 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> 0009-nfsv4-acl-Remove-unneeded-malloc-sizeof-FILE.patch is fixing
> following reports (other 2 has not been reported due previous)
> 
> Fixes:
> http://autobuild.buildroot.net/results/a38a5d8deaa365f73db427911df68dd10c6930a6
> http://autobuild.buildroot.net/results/dfa173caea08876ab69dd959da146b75750cdd28
> http://autobuild.buildroot.net/results/1e602f1574e9134a44d5d66838e7851b38e8069a
> http://autobuild.buildroot.net/results/f1b4b129ec94795b2144b4501b4301fb20892e71
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...compat_16-Always-include-sys-fsuid.h.patch |  52 +++
>  ...l-Remove-unneeded-malloc-sizeof-FILE.patch |  37 ++
>  .../0010-Replace-bzero-with-memset.patch      | 351 ++++++++++++++++++
>  3 files changed, 440 insertions(+)
>  create mode 100644 package/ltp-testsuite/0008-utils-compat_16-Always-include-sys-fsuid.h.patch
>  create mode 100644 package/ltp-testsuite/0009-nfsv4-acl-Remove-unneeded-malloc-sizeof-FILE.patch
>  create mode 100644 package/ltp-testsuite/0010-Replace-bzero-with-memset.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
