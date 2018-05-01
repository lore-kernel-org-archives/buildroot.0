From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 22:10:29 +0200
Subject: [Buildroot] [PATCH 1/1] libgeotiff: bump to version 1.4.2
In-Reply-To: <20180430200158.8259-1-fontaine.fabrice@gmail.com>
References: <20180430200158.8259-1-fontaine.fabrice@gmail.com>
Message-ID: <20180501221029.4afb5e94@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Apr 2018 22:01:58 +0200, Fabrice Fontaine wrote:
> - Add patch to fix autoheader issue: "missing template:
>   GEO_NORMALIZE_DISABLE_TOWGS84"
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...02-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch | 20 ++++++++++++++++++++
>  package/libgeotiff/libgeotiff.hash                   |  3 ++-
>  package/libgeotiff/libgeotiff.mk                     |  2 +-
>  3 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 package/libgeotiff/0002-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
