From: Michael Walle <michael@walle.cc>
Date: Thu, 21 Nov 2019 11:34:34 +0100
Subject: [Buildroot] [PATCH v2 02/10]
 package/freescale-qoriq/fsl-qoriq-rcw: move rcw into freescale-qoriq and
 rename it
In-Reply-To: <20191121102324.35225-3-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-3-jerry.huang@nxp.com>
Message-ID: <cf56bfbc478fb3ccf413f5d421f15477@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2019-11-21 11:23, schrieb Changming Huang:
> From: Jerry Huang <jerry.huang@nxp.com>
> 
> Move package/rcw into package/freescale-qoriq,
> and rename it to fsl-qoriq-rcw.
> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> ---
> changes since v1:
> 1. new patch
> 2. move rcw to sub-directory freescale-qoriq
> 3. rename to fsl-qoriq-rcw

shouldn't be the naming consistent with the sub-directory? I know there 
is already a freescale-imx and the packages are only named imx-*. On the 
other hand, the variable names will be longer. Mhh.

[snip]

-michael
