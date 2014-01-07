From: =?UTF-8?Q?makowski.pawel?= <makowski.pawel@o2.pl>
Date: Tue, 07 Jan 2014 14:25:31 +0100
Subject: [Buildroot] =?utf-8?q?New_Kernel_Module?=
Message-ID: <6d75f7d2.479c831d.52cc004b.8b1f5@o2.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,
I'm trying to add a new kernel module. In my ?understanding, the best way to do that is to add it into the Sample?Kernel Code?section in Kernel configuration (linux-menuconfig). I performe following steps:
&gt; 1. I put?an example?c file with well know hello_world example?to?/output/build/linux_xyz/samples/mykmod directory.
&gt; 2. I create Makefile for it: obj-$(CONFIG_SAMPLE_MYKMOD) += mykmod.o
&gt; 3. I add the new section to KConfig in samples directory.
?
When I run the make linux-menuconfig a new module is visible. So, I check it to the build.
After issued the make command there is visible that my module is built.
I download Kernel image and RootFs to the target and I can't find the?module file.
Where can I find this file ? How can I menage this module ?
--
Regards/Pozdrawiam
Pawe? Makowski
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140107/c667c8e5/attachment-0001.html>
