From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 10:26:02 +0200
Subject: [Buildroot] [PATCH 2/2] configs: add raspberrypi3 64bits
 defconfig
In-Reply-To: <7f20d3e0-f73b-de31-8d64-f36679d833d1@mind.be>
References: <20170414214551.17986-1-gael.portay@savoirfairelinux.com>
 <20170414214551.17986-3-gael.portay@savoirfairelinux.com>
 <7f20d3e0-f73b-de31-8d64-f36679d833d1@mind.be>
Message-ID: <20170415102602.2f085ffd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Apr 2017 00:22:12 +0200, Arnout Vandecappelle wrote:

>  BTW, does anyone know why the 32-bit version has cortex_a7?

I think because back when the rpi3 defconfig was added, there was no
selection of AArch64 cores.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
