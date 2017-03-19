From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 22:08:57 +0100
Subject: [Buildroot] [PATCH] package/keepalived: fix compilation with
 musl
In-Reply-To: <1488999383-18704-1-git-send-email-yann.morin.1998@free.fr>
References: <1488999383-18704-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170319220857.2e4a986d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Mar 2017 19:56:23 +0100, Yann E. MORIN wrote:
> Backport one patch from upstream to fix build without netlink.
> Add two patches to fix integer types.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/b61/b61c2cfa949c2a20f0702522857d78651207e6d2/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ilias Apalodimas <apalos@gmail.com>
> ---
>  ...onal-compilation-for-LIBIPVS-without-netl.patch | 35 +++++++++
>  .../0002-check-libipvs-add-missing-include.patch   | 36 +++++++++
>  .../0003-keepalived-ip_vs-fix-integer-types.patch  | 87 ++++++++++++++++++++++
>  3 files changed, 158 insertions(+)
>  create mode 100644 package/keepalived/0001-Fix-conditional-compilation-for-LIBIPVS-without-netl.patch
>  create mode 100644 package/keepalived/0002-check-libipvs-add-missing-include.patch
>  create mode 100644 package/keepalived/0003-keepalived-ip_vs-fix-integer-types.patch

Another simpler patch from Baruch, using what you contributed upstream,
has been applied. So I've marked this patch as Rejected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
