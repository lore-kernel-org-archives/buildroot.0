From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jun 2018 22:27:57 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: bump to version 3.0.1
In-Reply-To: <20180602181631.15522-1-fontaine.fabrice@gmail.com>
References: <20180602181631.15522-1-fontaine.fabrice@gmail.com>
Message-ID: <20180602222757.2a13494b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jun 2018 20:16:31 +0200, Fabrice Fontaine wrote:
> Remove both patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ools-lxc_monitor-include-missing-stddef.h.patch | 40 ------------
>  ...tion-with-static-libcap-and-shared-gnutls.patch | 73 ----------------------
>  package/lxc/lxc.hash                               |  2 +-
>  package/lxc/lxc.mk                                 |  2 +-
>  4 files changed, 2 insertions(+), 115 deletions(-)
>  delete mode 100644 package/lxc/0001-lxc-tools-lxc_monitor-include-missing-stddef.h.patch
>  delete mode 100644 package/lxc/0002-Fix-compilation-with-static-libcap-and-shared-gnutls.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
