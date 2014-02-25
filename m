From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Tue, 25 Feb 2014 10:04:34 +0100
Subject: [Buildroot] In Buildroot, how to compile kernel modules
Message-ID: <530C6AB2020000460004B173@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

the Internet and the buildroot manual couldn't help me out. I have a .c code which should be compiled to a .ko kernel module. Right now I'm doing this separately, the steps are: 

1. I run "make" of buildroot
2. Building the kernel module with the link to the linux kernel, that buildroot has downloaded.
3. After another make of buildroot, the .ko file is included via a fs-overlay and can be included with the "insmod" command

Usually this works, but often I get error messages which  tell me I'm using a different kernel version. So to avoid this I'd like to enqueue this .c code to the make process of buildroot. But I'm not sure how this is done. 

I actually just want to make changes on the Buildroot or Linux configuration and if Image is generated I'd still like to have a runnable kernel module. 

Can somebody tell me a hint about the steps, a manual or a tutorial ?

Kind Regards

Frank Ihle

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140225/07161769/attachment.html>
