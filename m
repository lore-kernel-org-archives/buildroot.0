From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 26 Apr 2016 16:27:33 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel version
 with rpi/rpi2
Message-ID: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I've tried to compile the repo version:
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"

with:
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y

For rpi/rpi2 and it doesn't work. The compiling is right but it doesn't
work, I can see the message on /dev/ttyAMA0 terminal:

Uncompressing Linux... done, booting the kernel.

But it's stuck at this point, however in RPi3 works fine.

Oscar Gomez Fuente
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160426/27383839/attachment.html>
