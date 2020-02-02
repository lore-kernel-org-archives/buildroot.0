From: Andrea Simeoni <andreasimeoni73@gmail.com>
Date: Sun, 2 Feb 2020 14:43:35 +0100
Subject: [Buildroot] Specify relative size of rootfs
Message-ID: <CAPmASetWvHgW2CJmUovxpdOTCYv0GMTQwX972mD5ytXWtOjevA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in Filesystem images > ext2/3/7 root filesystem I can specify the exact
size of the partition.
Instead I would find more useful to specify a relative size, to the minimum
needed. I.e., leave 200M free after putting in all the stuff. Otherwise I
need:

1. compile
2. burn an image (or mount locally)
3. inspect the disk usage with `df -h`
4. change the parameters above
5. compile

If I need to tweak my environment adding (or removing) packages I have to
do again all the steps.
Thanks
Andrea S.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200202/67427847/attachment.html>
