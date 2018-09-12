From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:02:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to version
 0.09.39
In-Reply-To: <20180912083312.5105-1-F.LaRoche@pilz.de>
References: <20180912083312.5105-1-F.LaRoche@pilz.de>
Message-ID: <20180912210228.1a7c282e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 10:33:12 +0200, Florian La Roche wrote:
> - package/stress-ng: bump to version 0.09.39
> - remove already contined patch 0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch
> 
> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
> ---
>  ...link-proc-fix-build-with-kernel-v3.9.patch | 38 -------------------
>  package/stress-ng/stress-ng.hash              |  2 +-
>  package/stress-ng/stress-ng.mk                |  2 +-
>  3 files changed, 2 insertions(+), 40 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
