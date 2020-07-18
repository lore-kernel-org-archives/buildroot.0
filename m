From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 16:03:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/nftables: bump to version 0.9.6
In-Reply-To: <20200716213138.2073736-1-fontaine.fabrice@gmail.com>
References: <20200716213138.2073736-1-fontaine.fabrice@gmail.com>
Message-ID: <20200718160359.2be19b7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jul 2020 23:31:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Drop host-bison and host-flex, not needed since version 0.9.5 and
>   https://git.netfilter.org/nftables/commit/?id=2885cf2e65042b3dbc44fc232fd35840df255935
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-src-main.c-fix-build-with-gcc-4.8.patch | 46 -------------------
>  package/nftables/nftables.hash                |  2 +-
>  package/nftables/nftables.mk                  |  5 +-
>  3 files changed, 3 insertions(+), 50 deletions(-)
>  delete mode 100644 package/nftables/0001-src-main.c-fix-build-with-gcc-4.8.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
