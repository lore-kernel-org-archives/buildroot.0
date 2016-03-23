From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Wed, 23 Mar 2016 17:48:40 +0100
Subject: [Buildroot] [fstab] The best way to modify the /etc/fstab
Message-ID: <CALtfCQZZJwRff1hWmA1vLf+EbHgFXsBGSvKwsNJ8wxdF+h-KWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm building a system from buildroot and I would like to know the best way
to add this line:

/dev/mmcblk0p1  /boot           vfat    defaults        0       2

to the file /etc/fstab.

Up to now ,I've executed a script, after the make is completed, with this
command:

sudo sh -c "cat << 'EOF' >> "${SD_ROOTFS_PATH}/etc/fstab"
/dev/mmcblk0p1  /boot           vfat    defaults        0       2

EOF"

But I'm trying to find something more professional. I'm pretty sure that
buildroot has a mechanism for this purpose.

Best regards.

Oscar Gomez Fuente.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160323/94b0817b/attachment.html>
