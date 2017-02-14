From: chris warth <cswarth@gmail.com>
Date: Tue, 14 Feb 2017 08:00:47 -0800
Subject: [Buildroot] uImage support for aarch64
Message-ID: <CAJJmP9D0JFq8Wjbp2MX+mXdca6Up+3z0XJ1Xs3ojc8UcU2p11Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can anyone shed some light on why uImage with device tree is not a
supported format for the aarch64 architecture under Buildroot?  (see
the definition of BR2_LINUX_KERNEL_APPENDED_UIMAGE in linux/Config.in)

The appended uImage options in linux/Config.in seem to be dependent on
the BR2_arm or BR2_armeb.  In fact the base uImage format does not
appear to be supported for BR2_aarch64 at all.

Is this an oversight or is there a technical challenge to supporting
AARCH64 images in uImage format?

Thank you in advance,

- Chris
