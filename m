From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 10:42:59 +0100
Subject: [Buildroot] [PATCH v10 1/6] binutils: install libiberty for
 host build
In-Reply-To: <20190206091531.104591-1-aduskett@gmail.com>
References: <20190206091531.104591-1-aduskett@gmail.com>
Message-ID: <20190317104259.5e92c84f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Feb 2019 04:15:26 -0500
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Add --enable-install-libiberty to HOST_BINUTILS_CONF_OPTS to allow
> prelink-cross to build properly.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v7:
>   - Add patch to series.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
