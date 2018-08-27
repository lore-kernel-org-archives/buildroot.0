From: LP C <lpdev@cordier.org>
Date: Mon, 27 Aug 2018 21:27:23 +0200
Subject: [Buildroot] Flashing EFI on internal SSD
Message-ID: <1535397652.local-c4538192-4736-v1.4.1-b1028ad4@getmailspring.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Simple question here. I have generated an .img file using the pc_x86_64_efi_defconfig. My embedded system is an Intel Computestick. Now I would like to flash the internal SSD drive of the computestick.
I tried to load a live distro (ubuntu) and tried to dd's the .img directly on the SSD block device and rebooted. Unfortunately the system says that no boot device has been detected.

Secure boot has been disabled in the bios, and UEFI is enabled.
Any clues on this?
THank you, BR
Louis-Paul CORDIER
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180827/2e713009/attachment.html>
