From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 21:55:12 +0100
Subject: [Buildroot] [PATCH] configs/qemu: update xtensa linux to 4.9
In-Reply-To: <1489517936-4563-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489517936-4563-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170314215512.1f5a02af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 11:58:56 -0700, Max Filippov wrote:
> Linux configs are missing memmap= option that is required for xtfpga
> boards configured w/o device tree starting with linux-4.9. Add it.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  board/qemu/xtensa-lx60/linux-4.8-nommu.config | 37 --------------------------
>  board/qemu/xtensa-lx60/linux-4.8.config       | 36 -------------------------
>  board/qemu/xtensa-lx60/linux-4.9-nommu.config | 38 +++++++++++++++++++++++++++
>  board/qemu/xtensa-lx60/linux-4.9.config       | 36 +++++++++++++++++++++++++
>  configs/qemu_xtensa_lx60_defconfig            |  8 +++---
>  configs/qemu_xtensa_lx60_nommu_defconfig      |  8 +++---
>  6 files changed, 82 insertions(+), 81 deletions(-)
>  delete mode 100644 board/qemu/xtensa-lx60/linux-4.8-nommu.config
>  delete mode 100644 board/qemu/xtensa-lx60/linux-4.8.config
>  create mode 100644 board/qemu/xtensa-lx60/linux-4.9-nommu.config
>  create mode 100644 board/qemu/xtensa-lx60/linux-4.9.config

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
