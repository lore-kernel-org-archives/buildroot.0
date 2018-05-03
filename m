From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 21:52:43 +0200
Subject: [Buildroot] [PATCH 1/1] liblinear: bump to version 2.20
In-Reply-To: <20180503150514.10864-1-fontaine.fabrice@gmail.com>
References: <20180503150514.10864-1-fontaine.fabrice@gmail.com>
Message-ID: <20180503215243.6a227a70@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 May 2018 17:05:14 +0200, Fabrice Fontaine wrote:
> - Slightly update first patch so it can apply on this version
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/liblinear/0001-blas-don-t-overwrite-ar-options.patch | 5 +++--
>  package/liblinear/liblinear.hash                             | 3 ++-
>  package/liblinear/liblinear.mk                               | 2 +-
>  3 files changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
