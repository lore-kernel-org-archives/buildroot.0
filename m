From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:36:53 +0200
Subject: [Buildroot] [PATCH 1/1] libminiupnpc: bump to version 2.1
In-Reply-To: <20180907204022.20328-1-fontaine.fabrice@gmail.com>
References: <20180907204022.20328-1-fontaine.fabrice@gmail.com>
Message-ID: <20180908153653.2538a5a4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Sep 2018 22:40:22 +0200, Fabrice Fontaine wrote:
> Remove patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-miniupnpc-Fix-CVE-2017-8798.patch    | 59 -------------------
>  package/libminiupnpc/libminiupnpc.hash        |  2 +-
>  package/libminiupnpc/libminiupnpc.mk          |  2 +-
>  3 files changed, 2 insertions(+), 61 deletions(-)
>  delete mode 100644 package/libminiupnpc/0001-miniupnpc-Fix-CVE-2017-8798.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
