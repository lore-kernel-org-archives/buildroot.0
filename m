From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Thu, 9 Jun 2016 15:12:04 -0400 (EDT)
Subject: [Buildroot] [PATCH v4 0/2] ARM: ts4800: add basic board support
In-Reply-To: <1465498542-7333-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1465498542-7333-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <1983896334.306157.1465499524883.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

v3 included 2 patches that were integrated in u-boot-imx recently.
In v4, this fork is selected as a custom U-boot until it's merge
into mainline U-boot and the patches were removed from 
board/technologic/ts4800/.

Thanks,

Patrick

----- On Jun 9, 2016, at 2:55 PM, Patrick Keroulas patrick.keroulas at savoirfairelinux.com wrote:

> This patchset adds support for the TS-4800 SoM manufactured by
> Technologic Systems based on the Freescale i.MX515 SoC.
> 
> Patrick Keroulas (2):
> ts4800-mbrboot: new package
> configs: add defconfig for TS-4800
> 
> board/technologic/ts4800/genimage.cfg | 37 ++++++++++++++++
> board/technologic/ts4800/linux.fragment | 3 ++
> board/technologic/ts4800/post-image.sh | 23 ++++++++++
> configs/ts4800_defconfig | 30 +++++++++++++
> package/Config.in | 1 +
> package/ts4800-mbrboot/Config.in | 5 +++
> package/ts4800-mbrboot/src/LICENSE | 25 +++++++++++
> package/ts4800-mbrboot/src/Makefile | 21 ++++++++++
> package/ts4800-mbrboot/src/mbrboot.c | 72 ++++++++++++++++++++++++++++++++
> package/ts4800-mbrboot/src/mbrboot.ld | 56 +++++++++++++++++++++++++
> package/ts4800-mbrboot/ts4800-mbrboot.mk | 22 ++++++++++
> 11 files changed, 295 insertions(+)
> create mode 100644 board/technologic/ts4800/genimage.cfg
> create mode 100644 board/technologic/ts4800/linux.fragment
> create mode 100755 board/technologic/ts4800/post-image.sh
> create mode 100644 configs/ts4800_defconfig
> create mode 100644 package/ts4800-mbrboot/Config.in
> create mode 100644 package/ts4800-mbrboot/src/LICENSE
> create mode 100644 package/ts4800-mbrboot/src/Makefile
> create mode 100644 package/ts4800-mbrboot/src/mbrboot.c
> create mode 100644 package/ts4800-mbrboot/src/mbrboot.ld
> create mode 100644 package/ts4800-mbrboot/ts4800-mbrboot.mk
> 
> --
> 1.9.1
