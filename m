From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:15:39 +0200
Subject: [Buildroot] [PATCH 0/5 v3] linux-firmware: more firmwares
 (branch yem/lnx-fw)
In-Reply-To: <cover.1411324588.git.yann.morin.1998@free.fr>
References: <cover.1411324588.git.yann.morin.1998@free.fr>
Message-ID: <20140921211539.5b52c434@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 21 Sep 2014 20:38:09 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (5):
>       package/linux-firmware: prepare new firmware and new revision for iwlwifi
>       package/linux-firmware: add new revision for iwlwifi firmware
>       package/linux-firmware: add option for iwl7265 firmware
>       package/linux-firmware: add option for Chelsio cxgb4 T5
>       package/linux-firmware: install Xceive/Cresta xc4000 and xc5000c
> 
>  Config.in.legacy                         | 39 +++++++++++++++++++++++
>  package/linux-firmware/Config.in         | 53 +++++++++++++++++++++++---------
>  package/linux-firmware/linux-firmware.mk | 27 ++++++++++++----
>  3 files changed, 99 insertions(+), 20 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
