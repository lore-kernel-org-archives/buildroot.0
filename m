From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:10:42 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/busybox: version bump to
 1.30.1
In-Reply-To: <20190325162819.13056-1-jared.bents@rockwellcollins.com>
References: <20190325162819.13056-1-jared.bents@rockwellcollins.com>
Message-ID: <20190325191042.0279e322@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Mar 2019 11:28:19 -0500
jared.bents at rockwellcollins.com wrote:

> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> Update from version 1.29.3 to 1.30.1. The new version
> includes the removed patches.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  ...l.sh-don-t-clobber-dangling-symlinks.patch |  38 -----
>  ...tions-are-indeed-4-byte-closes-11506.patch | 137 ------------------
>  ...HCP_SUBNET-ensure-it-is-4-bytes-long.patch |  58 --------
>  package/busybox/busybox.hash                  |   4 +-
>  package/busybox/busybox.mk                    |   2 +-
>  5 files changed, 3 insertions(+), 236 deletions(-)
>  delete mode 100644 package/busybox/0003-install.sh-don-t-clobber-dangling-symlinks.patch
>  delete mode 100644 package/busybox/0004-udhcpc-check-that-4-byte-options-are-indeed-4-byte-closes-11506.patch
>  delete mode 100644 package/busybox/0005-udhcpc-when-decoding-DHCP_SUBNET-ensure-it-is-4-bytes-long.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
