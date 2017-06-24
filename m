From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 15:16:59 +0200
Subject: [Buildroot] [PATCH v2 2/3] Board: Add Bananapi M2 Plus support
In-Reply-To: <1497804482-3511-2-git-send-email-jteki@openedev.com>
References: <1497804482-3511-1-git-send-email-jteki@openedev.com>
 <1497804482-3511-2-git-send-email-jteki@openedev.com>
Message-ID: <20170624151659.01297986@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 22:18:02 +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Add initial support for bananapi M2 Plus board with below features:
> - U-Boot 2017.07-rc1
> - Linux 4.11.5
> - Default packages from buildroot
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Essentially same comment as for the Bananapi M64. Also, please use
"board: " instead of "Board: " in the title.

Main comments:

 - .gitlab-ci.yml change needed
 - use BR2_TARGET_UBOOT_BOOT_SCRIPT
 - don't forget host-dosfstools and host-mtools if you're generating a
   VFAT filesystem

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
