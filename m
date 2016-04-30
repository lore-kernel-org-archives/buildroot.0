From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 30 Apr 2016 20:30:22 +0200
Subject: [Buildroot] Can not boot sdcard.img for raspberry pi 2
In-Reply-To: <CAPeTicN2Ov=iSNMxwJ85xYABtsJNubVADU4sYq7jBhw6Fp-jkg@mail.gmail.com>
References: <CAPeTicN2Ov=iSNMxwJ85xYABtsJNubVADU4sYq7jBhw6Fp-jkg@mail.gmail.com>
Message-ID: <20160430203022.0581ec14@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 20:16:35 +0300, sonntex <sonntex@gmail.com> wrote:

> I checkouted to the latest master commit with hash
> 70fc85f969c6aee7253d4098a70946e5b16eed4b and trying to build image for
> raspberry pi 2.
> 
> make raspberrypi2_defconfig
> make
> dd if=output/images/sdcard.img of=/dev/sdb
> 
> The image is not booted. Is it a bug? Can I correct it? I tryed to use two
> different hosts: debian jessie and gentoo.

Mind to test some some prebuild images (see [1])? Know they work on RPi1/Rpi3
(not personally tested on PPi2 because of lack of hardware)...

Regards,
Peter


[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159757.html
