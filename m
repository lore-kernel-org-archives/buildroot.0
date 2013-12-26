From: Ron Eggler <reggler@semios.com>
Date: Thu, 26 Dec 2013 15:50:06 +0000
Subject: [Buildroot] buildroot_defconfig Error
Message-ID: <CAO8ZbKt9uYRyRutgkMYFS4hY=EYASWEeyEXha4-q+9C6dmDMCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

About 30min into the compilation, I keep getting a "buildroot_defconfig"
error that I'm not able to get resolved.
It looks like this:
>>> linux 3.2.52 Configuring
cp "board/synapse/e10/linux-3.12.1-config"
/etc/E10-buildroot/br2013.11/output/build/linux-3.2.52/arch/arm/configs/buildroot_defconfig
cp: cannot stat ?board/synapse/e10/linux-3.12.1-config?: No such file or
directory
make: ***
[/etc/E10-buildroot/br2013.11/output/build/linux-3.2.52/.stamp_configured]
Error 1

How can I get this xcleaned up to complete the compilation?

Thank you,
Ron
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131226/31763e77/attachment.html>
