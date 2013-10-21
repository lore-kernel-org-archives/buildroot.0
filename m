From: Anirudha Bose <ani07nov@gmail.com>
Date: Mon, 21 Oct 2013 18:30:03 +0530
Subject: [Buildroot] Reproducing Autobuild errors
Message-ID: <CA+XvPyxsJ==djC78T2VeP=eFPHSLLfoXxbNerAYSj2i0SPaaKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone.

This is the first time I am posting in this mailing list so I would like to
introduce myself first. My name is Anirudha Bose, and I am an undergraduate
student doing my major in Computer Science. I am specifically interested in
contributing to Buildroot because I have done some similar work using M
Cross Environment (MXE) during Google Summer of Code 2013.

For a start I am trying to fix some Autobuild errors. For example if I am
trying to fix this error [1]. Here are the steps I did to reproduce the
error on my machine.

1. Downloaded the config file and saved it as .config in my buildroot dir.
2. Downloaded the Power PC 603e toolchain from this [2] link.
*3.* I still don't know where to extract and keep this tarball; and what
should be the path in the .config file. I also do not know what to do with
the defconfig file. Should I save it as .defconfig in the buildroot dir?
4. make

After this I expect to get the same error which I see in the log of
autobuild. I intend to fix this by compiling the package which failed with
an extra CFLAG. So, where am I supposed to make this change?

[1]
http://autobuild.buildroot.org/results/912/91289fc77e7dc7ed6342414df91c35d78d7eabc2/build-end.log

[2] http://autobuild.buildroot.org/toolchains/tarballs/


I hope someone helps me out. I tried asking in the IRC channel, but my
timezone is very different so I never got any reply.

- Anirudha
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131021/468c24ec/attachment.html>
