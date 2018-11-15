From: tochansky at tochlab.net <tochansky@tochlab.net>
Date: Thu, 15 Nov 2018 14:21:36 +0000
Subject: [Buildroot] version `GLIBC_2.27' not found
Message-ID: <a59aa43d9d9f5a8e734185c9efd73c75@tochlab.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I have a strange behavior of toolchain built by buildroot.

I made a toolchain on pc with gentoo linux and took it to kubuntu 16.04 LTS and ld reports:

/opt/moonshine/bin/x86_64-moonshine-linux-gnu-ld: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.27' not found (required by /opt/moonshine/bin/x86_64-moonshine-linux-gnu-ld)

same time /opt/moonshine/bin/x86_64-moonshine-linux-gnu-gcc works fine.

As I can see, there is glibc 2.27 on gentoo and 2.23 on kubuntu. Thing I can't understand is why other tools(gcc for example) works normal.

--
D
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181115/8e4a81c0/attachment.html>
