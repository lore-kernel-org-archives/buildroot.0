From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 22:13:10 +0100
Subject: [Buildroot] [PATCH v2 01/10] package/freescale-qoriq: new
 package directory
In-Reply-To: <20191121102324.35225-2-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-2-jerry.huang@nxp.com>
Message-ID: <20191125221310.52424ae6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Nov 2019 18:23:15 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> The freescale-qoriq directory is intended to contain all freescale
> QorIQ (including PowerPC and LayerScape serial) related packages,
> together with their download site and version info.
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>

So I think I read somewhere that you were suggested to use
package/nxp-qoriq/ instead of package/freescale-qoriq/. This change is
fine to me, so feel fee to do it in your v3.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
