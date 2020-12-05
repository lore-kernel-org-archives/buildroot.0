From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:41:45 +0100
Subject: [Buildroot] [PATCH/next v1 1/2] package/ell: bump version to
 0.35
In-Reply-To: <20201201223759.11147-1-ps.report@gmx.net>
References: <20201201223759.11147-1-ps.report@gmx.net>
Message-ID: <20201205214145.2b853d84@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Dec 2020 23:37:58 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - rebased (and renumbered) 001-ell-rtnl-fix-compile-with-older-toolchains.patch
> 
> - drop dynamic library dependency as no longer needed since
>   upstream commits [1] and [2]
> 
> - add two upstream patches to fix musl/uclibc compile
> 
> [1] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=e129cb4cd2270f308c1564e75859672643dd902b
> [2] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=a4ac2cb0e14f564754f7e2067ac7dde0a9ab1914
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...l-fix-compile-with-older-toolchains.patch} | 20 ++++----
>  ...002-build-Add-rawmemchr-to-missing.h.patch | 47 +++++++++++++++++++
>  ...l-add-missing-include-in-dhcp-server.patch | 26 ++++++++++
>  package/ell/Config.in                         |  6 +--
>  package/ell/ell.hash                          |  2 +-
>  package/ell/ell.mk                            |  2 +-
>  6 files changed, 88 insertions(+), 15 deletions(-)
>  rename package/ell/{0002-ell-rtnl-fix-compile-with-older-toolchains.patch => 0001-ell-rtnl-fix-compile-with-older-toolchains.patch} (84%)
>  create mode 100644 package/ell/0002-build-Add-rawmemchr-to-missing.h.patch
>  create mode 100644 package/ell/0003-ell-add-missing-include-in-dhcp-server.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
