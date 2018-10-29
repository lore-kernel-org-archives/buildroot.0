From: Lijun QIN <lijun.qin2008@gmail.com>
Date: Mon, 29 Oct 2018 10:46:50 -0500
Subject: [Buildroot] gcc 8.2.0 support for buildroot 2015.11
Message-ID: <CALD51P_=q448T76Mi66Sjcy8Lfdhi-UKBn0A33_6isVHU_-bFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I generated gcc 8.2.0  arm-buildroot-linux-gnueabihf-gcc using
buildroot-2018.08.2.
I need to use arm gcc 8.2 to compile my project (buildroot 2015.11 + C++
Codebase)  to leverage C++17 features.
Buildroot 2015.11 seems to only support gcc up to version 5.x.
Any patch to make 2015.11 to support arm gcc 8.2 as external toolchain ?
Thank you,
Lijun Qin



<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail&utm_term=icon>
Virus-free.
www.avast.com
<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail&utm_term=link>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181029/ced53099/attachment.html>
