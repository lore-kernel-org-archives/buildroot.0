From: David Park <djpark121@gmail.com>
Date: Sun, 26 Jul 2020 22:21:01 -0700
Subject: [Buildroot] pc defconfig image does not boot
Message-ID: <CACef8rpYbbO6p7srvegq0XqwEcVk2LHAiTRsMmLjcpi8CHn8xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I created a PC disk.img from the pc_x86_64_efi_defconfig config file
following exactly the instructions outlined in board/pc/readme.txt.

make pc_x86_64_efi_defconfig

Running this disk.img in qemu boots fine with no issues, but when I write
the image to a pendrive using the listed commands:

dd if=output/images/disk.img of=/dev/sdc; sync

And then insert it into my PC, it doesn't boot all the way. I only see the
GRUB menu with the Buildroot image listed, but when GRUB tries to run this
image, I only see "Booting Buildroot", and then nothing else.

Am I missing some steps here that aren't in the readme?

--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200726/5da3b9ae/attachment.html>
