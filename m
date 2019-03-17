From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:29:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/keepalived: bump to version
 2.0.13
In-Reply-To: <20190317160756.29049-1-fontaine.fabrice@gmail.com>
References: <20190317160756.29049-1-fontaine.fabrice@gmail.com>
Message-ID: <20190317172922.02119d88@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 17:07:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch   | 61 ----------------------
>  ...include-files-in-configure-COLLISION-test.patch | 38 --------------
>  package/keepalived/keepalived.hash                 |  2 +-
>  package/keepalived/keepalived.mk                   |  2 +-
>  4 files changed, 2 insertions(+), 101 deletions(-)
>  delete mode 100644 package/keepalived/0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch
>  delete mode 100644 package/keepalived/0002-Fix-order-of-include-files-in-configure-COLLISION-test.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
