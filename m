From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 23:07:37 +0200
Subject: [Buildroot] [PATCH v3] board: Add a13_olinuxino Support
In-Reply-To: <1497803289-14530-1-git-send-email-chakra@openedev.com>
References: <1497803289-14530-1-git-send-email-chakra@openedev.com>
Message-ID: <20170621230737.754cb25e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 21:58:09 +0530, Chakra Divi wrote:
> Add initial support for a13_olinuxino board
> with below features
> - U-Boot 2017.05
> - Linux 4.11.5
> - Default packages from buildroot
> 
> Signed-off-by: Chakra Divi <chakra@openedev.com>
> ---
> Changes for v2:
> - Add missing readme.txt
> Changes for v3:
> - Updating missed DEVELOPERS file changes

Applied to master, with the following changes:

    [Thomas:
     - use full name in DEVELOPERS file
     - remove parametrization of the post-build.sh script, just hardcode
       the boot.cmd file used as input
     - add missing dosfstools and mtools host packages in defconfig,
       needed because a vfat partition is defined in the genimage.cfg
       file
     - minor tweaks to readme.txt file.]

Could you please check that what I have committed continues to work fine
for you? Thanks a lot!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
