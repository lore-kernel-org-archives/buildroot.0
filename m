From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:08:47 +0100
Subject: [Buildroot] [PATCH 1/1] keepalived: fix if.h namespace collision
In-Reply-To: <20190110164328.10022-1-fontaine.fabrice@gmail.com>
References: <20190110164328.10022-1-fontaine.fabrice@gmail.com>
Message-ID: <20190113140847.0725372d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Jan 2019 17:43:28 +0100, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/d229602f2e477499c86567e0e8a3535513d322e8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...include-files-in-configure-COLLISION-test.patch | 38 ++++++++++++++++++++++
>  package/keepalived/keepalived.mk                   |  2 ++
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/keepalived/0002-Fix-order-of-include-files-in-configure-COLLISION-test.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
