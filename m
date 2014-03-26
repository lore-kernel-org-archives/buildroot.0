From: Eric Limpens <limpens@gmail.com>
Date: Wed, 26 Mar 2014 09:45:17 +0100
Subject: [Buildroot] libusb / udev support issue when using systemd and
	raspberrypi_defconfig
Message-ID: <CABGWzsQM1qyfQ8c7aMJ+ARU6RvQQxPRC=s1Uh3jBijJZQ-ADSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 I'ld like to use systemd as init system on a RaspberryPi. Following these
steps, libusb complains about the lack of udev support (missing libudev):

git clone git://git.busybox.net/buildroot
make raspberrypi_defconfig
make menuconfig
 --> select glibc as C library
 --> select systemd as init system
 --> select package libusb
make

Is this a glitch with setting one of the BR2_PACKAGE_HAS_UDEV or
BR2_PACKAGE_PROVIDERS_UDEV variables?

Eric
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140326/92380788/attachment.html>
