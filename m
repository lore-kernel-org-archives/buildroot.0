From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 14:56:08 +0200
Subject: [Buildroot] [PATCH v5 5/5] board: Add support for Engicam
 Is.IoT MX6UL SOM
In-Reply-To: <1498220769-22961-6-git-send-email-jteki@openedev.com>
References: <1498220769-22961-1-git-send-email-jteki@openedev.com>
 <1498220769-22961-6-git-send-email-jteki@openedev.com>
Message-ID: <20170624145608.5d02a515@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Jun 2017 17:56:09 +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Add initial support for Engicam Is.IoT MX6UL SOM board
> with below features:
> - U-Boot 2017.07-rc1
> - Linux 4.11.5
> - Default packages from buildroot
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
> - Newly added patch

Applied to master, after adding host-dosfstools/host-mtools. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
