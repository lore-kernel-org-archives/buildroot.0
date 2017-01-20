From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 16:45:51 +0100
Subject: [Buildroot] [PATCH 1/4] configs/altera_sockit: bump kernel to
	4.7 and u-boot to v2016.11-rc3
In-Reply-To: <20170120141513.34e1010e@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 20 Jan 2017 14:15:13 +1100")
References: <1484839933-17637-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
 <1484839933-17637-2-git-send-email-lucas.bajolet@savoirfairelinux.com>
 <20170120141513.34e1010e@free-electrons.com>
Message-ID: <87efzxspjk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 19 Jan 2017 10:32:10 -0500, Lucas Bajolet wrote:

 >> BR2_TARGET_UBOOT=y
 >> -BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
 >> +BR2_TARGET_UBOOT_BOARDNAME="socfpga_sockit"
 >> BR2_TARGET_UBOOT_CUSTOM_GIT=y
 >> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.rocketboards.org/u-boot-socfpga.git"
 >> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_acds13.0sp1"
 >> BR2_TARGET_UBOOT_PATCH="board/altera/sockit"
 >> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga"
 >> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2016.11-rc3"

 > Why do you bump to a -rc version rather than a final stable version?

And as this v2016.11-rc3 tag is identical to the upstream v2016.11-rc3
tag, why use this u-boot-socfpga repo instead of upstream u-boot?

-- 
Bye, Peter Korsgaard
