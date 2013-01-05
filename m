From: Alex Bradbury <asb@asbradbury.org>
Date: Sat, 5 Jan 2013 23:05:31 +0000
Subject: [Buildroot] [PATCH 3/3] rpi-firmware: New package
In-Reply-To: <033a0b8264805de1fb670bf727c756b94d4eb34b.1357426077.git.maxime.hadjinlian@gmail.com>
References: <cover.1357426077.git.maxime.hadjinlian@gmail.com>
 <033a0b8264805de1fb670bf727c756b94d4eb34b.1357426077.git.maxime.hadjinlian@gmail.com>
Message-ID: <CA+wH2971JOq_Hm0a-g219PNZr8S70C5eMwR5pcA-KcFhkT8tng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 January 2013 22:55, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:
> +RPI_FIRMWARE_VERSION = 76d0ac38f16b6343c6155c80db1e4758b3a5838a
> +RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
> +RPI_FIRMWARE_LICENSE = BSD-3c
> +RPI_FIRMWARE_LICENSE_FILE = boot/LICENCE.broadcom

Although at a glance the licence file looks like 3-clause BSD (which
the licence for the Raspberry Pi 'userland' code is), it's actually
not. It only allows distribution without modification and has the
condition "This software may only be used for the purposes of
developing for, running or using a Raspberry Pi device." The license
is of course derived from the BSD license, and looks pretty similar to
the license Intel uses for various wlan firmware.

Regards,

Alex
