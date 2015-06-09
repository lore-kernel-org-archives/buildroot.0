From: Marco Pastorelli <mpastorelli@gmail.com>
Date: Tue, 9 Jun 2015 13:41:41 +0200
Subject: [Buildroot] BR variable that points the built kernel
Message-ID: <CAFRxoJ=gnhumch8GfcSEp0ettOYaRQUhc8in3uwO3MaH1d4wyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

I'm writing a post build script and I'm looking for a variable that points
to the directory where the kernel has been built.

So far I have used ${BUILD_DIR}/linux-custom/ but this is not portable
since it depends on the kernel version.

Does anyone know a better way to address my problem?

Additional info:
I'm using buildroot-2014.08

Thank you!
Regards,

Marco.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150609/13e0c6ef/attachment.html>
