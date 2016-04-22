From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Apr 2016 22:18:51 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3.
In-Reply-To: <1461150240-23107-1-git-send-email-ubaldo@eja.it> (Ubaldo
 Porcheddu's message of "Wed, 20 Apr 2016 11:04:00 +0000")
References: <1461150240-23107-1-git-send-email-ubaldo@eja.it>
Message-ID: <8737qdtn10.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ubaldo" == Ubaldo Porcheddu <ubaldo@eja.it> writes:

 > Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
 > ---
 >  board/raspberrypi3/genimage-raspberrypi3.cfg | 30 +++++++++++++
 >  board/raspberrypi3/post-build.sh             |  9 ++++
 >  board/raspberrypi3/post-image.sh             | 22 ++++++++++
 >  board/raspberrypi3/readme.txt                | 64 ++++++++++++++++++++++++++++
 >  configs/raspberrypi3_defconfig               | 36 ++++++++++++++++
 >  5 files changed, 161 insertions(+)
 >  create mode 100644 board/raspberrypi3/genimage-raspberrypi3.cfg
 >  create mode 100755 board/raspberrypi3/post-build.sh
 >  create mode 100755 board/raspberrypi3/post-image.sh
 >  create mode 100644 board/raspberrypi3/readme.txt
 >  create mode 100644 configs/raspberrypi3_defconfig

Thanks. Aren't these basically identical to the rpi1/rpi2 variants
(except for the genimage script)? Please rework it to simply add a
raspberrypi3 symlink like we do for raspberrypi2.

-- 
Bye, Peter Korsgaard
