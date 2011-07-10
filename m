From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 22:27:39 +0200
Subject: [Buildroot] [PATCH 22/28] boot: rename BR2_TARGET_* to
	BR2_BOOT_*
In-Reply-To: <66caabc54512ea1f23a7361744fd5e9c74d8a192.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:54:13 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <66caabc54512ea1f23a7361744fd5e9c74d8a192.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <877h7pyj7o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  boot/at91bootstrap/Config.in                |   18 +++---
 Thomas>  boot/at91bootstrap/at91bootstrap.mk         |    8 +-
 Thomas>  boot/at91dataflashboot/Config.in            |    2 +-
 Thomas>  boot/at91dataflashboot/at91dataflashboot.mk |    2 +-
 Thomas>  boot/barebox/Config.in                      |    8 +-
 Thomas>  boot/barebox/barebox.mk                     |   12 ++--
 Thomas>  boot/grub/Config.in                         |   94 +++++++++++++-------------
 Thomas>  boot/grub/grub.mk                           |   50 +++++++-------
 Thomas>  boot/syslinux/Config.in                     |   10 ++--
 Thomas>  boot/syslinux/syslinux.mk                   |    6 +-
 Thomas>  boot/u-boot/Config.in                       |   70 ++++++++++----------
 Thomas>  boot/u-boot/u-boot.mk                       |   34 +++++-----
 Thomas>  12 files changed, 157 insertions(+), 157 deletions(-)

Is this purely cosmetical or is there a deeper reason for this? This
presumably breaks all existing configs where bootloaders are used.

-- 
Bye, Peter Korsgaard
