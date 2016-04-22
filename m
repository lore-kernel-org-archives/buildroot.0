From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 22:25:51 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3.
In-Reply-To: <8737qdtn10.fsf@dell.be.48ers.dk>
References: <1461150240-23107-1-git-send-email-ubaldo@eja.it>
 <8737qdtn10.fsf@dell.be.48ers.dk>
Message-ID: <20160422222551.700fdf70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Apr 2016 22:18:51 +0200, Peter Korsgaard wrote:

> Thanks. Aren't these basically identical to the rpi1/rpi2 variants
> (except for the genimage script)? Please rework it to simply add a
> raspberrypi3 symlink like we do for raspberrypi2.

Why do we even have a symlink? If all files are the same, why aren't we
referencing board/raspberrypi/ files from the raspberrypi2_defconfig?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
