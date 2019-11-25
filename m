From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 22:17:06 +0100
Subject: [Buildroot] [PATCH v2 03/10]
 package/freescale-qoriq/fsl-qoriq-rcw: upgrade the rcw version to
 LSDK-19.09
In-Reply-To: <20191121102324.35225-4-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-4-jerry.huang@nxp.com>
Message-ID: <20191125221706.716d6b10@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Nov 2019 18:23:17 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> From: Jerry Huang <jerry.huang@nxp.com>
> 
> Change the RCW version to LSDK-19.09.
> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>

The commit title should be:

	package/<packagename>: bump to version LSDK-19.03

> diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
> index 7de1ec659a..413db80e6d 100644
> --- a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
> +++ b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 rcw-LSDK-18.12.tar.gz
> +sha256 4dca8adeda48836b86aa459cc526dfbb4e0873492682c3c3a828a28b82b7b100 fsl-qoriq-rcw-LSDK-19.09.tar.gz

The renaming of the tarball should have happened in patch 02/10, not
here: we should just see the change of the version number here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
