From: Assaf Inbal <shmuelzon@gmail.com>
Date: Thu, 3 May 2012 18:14:49 +0300
Subject: [Buildroot] Building For Host as Target
Message-ID: <CADwac6DA5MDVkfZDmAO-s2+rPsebpefJ-paTWLzkk0hC_qAOZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

I'm working on a project based on buildroot and I want to have the ability
to compile my packages for both my MIPS target using an external toolchain
(which works great) but I also want to be able to compile for my host.
To be precise, I want to use the local gcc and libraries so I will be able
to run my packages locally as well.
I've tried setting an external toolchain path as "/usr" but as a part of
preparing the target file system everything from my /lib,/etc and others
are copied to the output directory, which is, well, bad.

I've also toyed with creating a fake toolchain that was basically links to
the host's binaries but that also didn't go very well.

Does anyone have an idea on how I might be able to achieve this?

Thanks,
Shmuelzon
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120503/f6004519/attachment.html>
