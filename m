From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Sun, 6 Sep 2015 14:33:15 +0530
Subject: [Buildroot] Buildroot kconfig option
Message-ID: <CAKpDV8vL7GHk3cQ5Jk5o4G654KfQpQAfopsrA0Fotvu+vsaKMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am downloading kernel directly using buildroot. Then select "
Using an in-tree defconfig file" then
type the name of the defconfig.

Here i am using a already existing defconfig file in kernel source tree.

Now it could be the case existing configuration in Linux kernel source may
not be as per my requirement.

My question is, can i perform kconfig operation on the kernel source
downloaded by buildroot , so that i can tune kernel as per my requirement ?

Buildroot manual says :--
"use make linux-menuconfig to open the Linux configuration editor"
http://buildroot.uclibc.org/downloads/manual/manual.html#configure

Or i download kernel source separately & configure it separately & tell
buildroot to use it ?

How you use to deal with this situation related to kernel kconfig ?

Regards,
Katoch
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150906/571f032c/attachment.html>
