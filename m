From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Mar 2007 09:06:17 +0100
Subject: [Buildroot] Isn't the "target/linux26.mk" broken?
In-Reply-To: <45F1006A.7030604@atmel.com>
References: <45F1006A.7030604@atmel.com>
Message-ID: <20070309080617.GA9863@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 09, 2007 at 07:36:26AM +0100, Ulf Samuelsson wrote:
>It does not "make <xxx>_defconfig" so it only works with x86 architecture...

make LINUX26_KCONFIG=linux26.config
If you do not have a kernel .config yet, then
make linux26-menuconfig
