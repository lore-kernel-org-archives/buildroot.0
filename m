From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 14:14:01 +0200
Subject: [Buildroot] [PATCH v5 1/5] board: Add support for Engicam
 i.CoreM6 DualLite/Solo boards
In-Reply-To: <1498220769-22961-2-git-send-email-jteki@openedev.com>
References: <1498220769-22961-1-git-send-email-jteki@openedev.com>
 <1498220769-22961-2-git-send-email-jteki@openedev.com>
Message-ID: <20170624141401.12cff7fe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Jun 2017 17:56:05 +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Add initial support for Engicam i.CoreM6 DualLite/Solo board
> with below features:
> - U-Boot 2017.07-rc1
> - Linux 4.11.5
> - Default packages from buildroot
> 
> U-Boot 2017.07-rc1 has common u-boot defconfig for All i.CoreM6
> variant boards, so this patch update the same along with
> buildroot defconfig that reflect the common name.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v5:
> - Drop _mmc in defconfig
> - Update size of vfat partition
> - Add sync command after writing mmc 
> - Update .gitlab-ci.yml
> Changes for v4:
> - Update .gitlab-ci.yml
> Changes for v3:
> - Use kernel version 4.11.5
> Changes for v2:
> - Fix genimage.cfg path in readme.txt
> - Remove exctra " in BR2_LINUX_KERNEL_INTREE_DTS_NAME

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
