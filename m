From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 01 May 2017 20:34:14 -0300
Subject: [Buildroot] [v3 1/1] configs: add raspberrypi3 64bits defconfig
References: <20170418155959.27129-1-gael.portay@savoirfairelinux.com>
Message-ID: <5907c5f664aed_46013f8c5aa7da0c8119@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Apr 18, 2017 at 12:59 PM, Ga?l PORTAY wrote:

> This configuration builds a 64bit image for RaspberryPi 3.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[build-tested: in the host 'file output/target/bin/busybox' shows
'setuid ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV)'...;
boot-tested: I can login using the HDMI console,
and in the target 'cat /proc/cpuinfo' shows 'CPU architecture: 8']

I can't test the mini UART yet, sorry.

Regards,
Ricardo
