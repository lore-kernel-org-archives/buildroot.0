From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 10:23:22 +0200
Subject: [Buildroot] pc defconfig image does not boot
In-Reply-To: <CACef8rpYbbO6p7srvegq0XqwEcVk2LHAiTRsMmLjcpi8CHn8xA@mail.gmail.com>
 (David Park's message of "Sun, 26 Jul 2020 22:21:01 -0700")
References: <CACef8rpYbbO6p7srvegq0XqwEcVk2LHAiTRsMmLjcpi8CHn8xA@mail.gmail.com>
Message-ID: <871rkxwemd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Park <djpark121@gmail.com> writes:

 > Hi,
 > I created a PC disk.img from the pc_x86_64_efi_defconfig config file
 > following exactly the instructions outlined in board/pc/readme.txt.

 > make pc_x86_64_efi_defconfig

 > Running this disk.img in qemu boots fine with no issues, but when I write
 > the image to a pendrive using the listed commands:

 > dd if=output/images/disk.img of=/dev/sdc; sync

 > And then insert it into my PC, it doesn't boot all the way. I only see the
 > GRUB menu with the Buildroot image listed, but when GRUB tries to run this
 > image, I only see "Booting Buildroot", and then nothing else.

If it boots with qemu, then the image is probably fine.

What are the specs of the PC that you are trying to boot it on?

-- 
Bye, Peter Korsgaard
