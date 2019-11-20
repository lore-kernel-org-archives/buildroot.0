From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 09:57:21 +0100
Subject: [Buildroot] [PATCH 5/9] package/freescale-qoriq: new package
 directory
In-Reply-To: <20191120040725.32207-6-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-6-jerry.huang@nxp.com>
Message-ID: <20191120095721.75625023@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jerry,

On Wed, 20 Nov 2019 12:07:21 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> The freescale-qoriq directory is intended to contain all freescale
> QorIQ (including PowerPC and LayerScape serial) related packages,
> together with their download site and version info.
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>

Do you really expect to have multiple package in this sub-directory ?
Your patch series is adding only one.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
