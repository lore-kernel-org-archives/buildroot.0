From: qblade <qblade@protonmail.com>
Date: Sat, 03 Apr 2021 10:16:51 +0000
Subject: [Buildroot] package: add kmscon
Message-ID: <XQTayAXJ0ouEvKU_bcf0tyt6DOSr7_rf8dmmfl2a69DXbglRV1NCkl0buP5dG9ag5D1-UeOQFi6XBAyQSmPFOUu6W3nrggufcZqjkctXEbM=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I added two packages, libtsm is a dependent library of kmscon.

kmscon does better than fbterm in 256color.

Multiple font engine support of kmscon will be added later, currently only unifont is supported.

I tested it on the following platforms and it works fine

x86_64 glibc musl uclibc
aarch64 glibc musl uclibc
i386 glibc musl uclibc
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-package-add-libtsm.patch
Type: text/x-patch
Size: 2670 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210403/12476374/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-package-add-kmscon-a-terminal-emulator-based-on-linu.patch
Type: text/x-patch
Size: 2823 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210403/12476374/attachment-0001.bin>
