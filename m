From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 15:01:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/babeld: bump to version 1.8.4
In-Reply-To: <20190413194547.16098-1-fontaine.fabrice@gmail.com>
References: <20190413194547.16098-1-fontaine.fabrice@gmail.com>
Message-ID: <20190414150125.04a912fd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Apr 2019 21:45:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...nk.c-don-t-include-linux-if_bridge.h.patch | 78 -------------------
>  package/babeld/babeld.hash                    |  3 +-
>  package/babeld/babeld.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 80 deletions(-)
>  delete mode 100644 package/babeld/0001-kernel_netlink.c-don-t-include-linux-if_bridge.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
