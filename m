From: lpdev at cordier.org <lpdev@cordier.org>
Date: Tue, 28 Aug 2018 11:13:11 +0200 (CEST)
Subject: [Buildroot] genimage with GPT partition
Message-ID: <ea-mime-5b851227-2313-3c034151@www-1.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

After successfully booting an EFI-generated distro, I am now looking for an easy-to-install steps for my image file. (using the pc_x86_64_efi_defconfig). 

I first tried to flash directly the .img file on my device, and actually it does not boot. The reason is because the generated .img file is containing mbr partition instead of gpt.

Is it a limitation of genimage? Is there any way to generate a gpt-compatible .img file?

Note that I cannot use legacy boot in my bios.

Thank you for your help.
BR, Louis-Paul CORDIER

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180828/b63a5653/attachment.html>
