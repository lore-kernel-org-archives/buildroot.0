From: =?UTF-8?Q?Gabriel_Andr=C3=A9s_Castillo?= <gcastillo@controlnet.com.ar>
Date: Wed, 27 Jan 2016 11:20:10 -0300
Subject: [Buildroot] Verifying Checksum ... Bad Data CRC
Message-ID: <CAKvcKqe0ikfjVcKcoTASC9LzsEcwfYpFmqMziqF_MjhYWVsipw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, when i configure linux kernel, on kernel features -> preemption model,
i had "No forced preemption" and the boot was working fine. But when i want
to change the option to "Preemptible Kernel", i want to boot again and i
get this:


NAND read: device 0 offset 0x180000, size 0x10000
 65536 bytes read: OK

NAND read: device 0 offset 0x200000, size 0x380000
 3670016 bytes read: OK
## Booting kernel from Legacy Image at 22000000 ...
   Image Name:   Linux-4.1.0-linux4sam_5.0
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3730848 Bytes = 3.6 MiB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... Bad Data CRC
ERROR: can't get kernel image!

How can i make my kernel preemptible?

--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160127/789e157b/attachment.html>
