From: Fragkiskos Sigalas <frasigal@gmail.com>
Date: Wed, 12 Jun 2019 19:18:45 +0300
Subject: [Buildroot] add option to run docker with initramfs
Message-ID: <CAL+Nh7PQaDFU_SrWoV_W7-H=s6Y4ALHeC3A_LUozY+SnyXo3Lw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

By default docker uses pivot_root which is not available in initramfs. The
way to override the default behaviour is to define an environment variable
DOCKER_RAMDISK when starting the daemon (weirdly enough there appears to be
no respective command line option).

Would it make sense to add such an option in the docker package?

Regards,
Frank
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190612/3cedf989/attachment.html>
