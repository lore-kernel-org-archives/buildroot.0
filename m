From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 15:01:46 +0100
Subject: [Buildroot] [PATCH/next v3 4/5] configs/beaglebone_qt5: bump
 kernel and U-Boot, add weston
In-Reply-To: <20191115125001.28255-5-unixmania@gmail.com>
References: <20191115125001.28255-1-unixmania@gmail.com>
 <20191115125001.28255-5-unixmania@gmail.com>
Message-ID: <20191230150146.2e82eac3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Nov 2019 09:50:00 -0300
unixmania at gmail.com wrote:

> From: Lothar Felten <lothar.felten@gmail.com>
> 
> - Use the same kernel repository and version as configs/beaglebone
> - Rename kernel fragment file
> - Update U-Boot to 2019.07
> - Select weston and qt5wayland
> - Select host-uboot-tools with FIT support, required to create the
>   images.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> Changes v1->v2:
> - Switch kernel source URL to BeagleBoard repository
> - Select host-uboot-tools
> - Update commit message
> ---
>  ...ux-4.1-sgx.fragment => linux-sgx.fragment} |  1 +
>  configs/beaglebone_qt5_defconfig              | 23 +++++++++++--------
>  2 files changed, 14 insertions(+), 10 deletions(-)
>  rename board/beaglebone/{linux-4.1-sgx.fragment => linux-sgx.fragment} (92%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
