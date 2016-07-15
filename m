From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 19:24:14 +0200
Subject: [Buildroot] [PATCH v6 1/2] ts4800-mbrboot: new package
In-Reply-To: <20160715161217.GG3692@free.fr>
References: <1468594860-14932-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1468594860-14932-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <20160715161217.GG3692@free.fr>
Message-ID: <20160715192414.48d5fc36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jul 2016 18:12:17 +0200, Yann E. MORIN wrote:

> Otherwise looks sane.

Since this package is a bootloader, it should be in boot/ and its
option named BR2_TARGET_TS4800_MBRBOOT, to be consistent with other
bootloaders.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
