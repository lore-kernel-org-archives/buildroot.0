From: Mike Davies <busybox_mail@rovoreed.com>
Date: Sun, 05 Jun 2011 15:40:05 +0100
Subject: [Buildroot] Packages Post-extract pre-patch phase ?
Message-ID: <1307284805.2767.10.camel@ceri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is it possible to have a "post extract" or "pre patch" phase ?

The reason is that I have a tarball (opencv-2.2) which comes with .rej
files in it. This stops buildroot dead.

I need to run some sort of command like ...

find $(LIBFOO_DIR) -name *.rej -delete
