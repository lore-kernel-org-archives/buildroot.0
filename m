From: John Voltz <john.voltz@gmail.com>
Date: Tue, 29 Apr 2008 13:39:57 -0400
Subject: [Buildroot] x86 image for download
Message-ID: <46a136670804291039y34a80ff2p70bd4d38a63ffcf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I finally created a bootable x86 image using buildroot, and a lot of
hand-copying of files to my target dir. It's available for download if
anyone is interested, it could be a nice testbed to use. It has kernel
2.6.24.4, X windows, gtk, some games, festival tts, and WebKit.

It's available here in two flavors, qemu ext3 image or VMware vmdk virtual
disk:

ftp://64.31.81.93/

The qemu image is more flexible as it can be mounted independently and also
can be converted to vmdk using qemu-img.

It's mountable like this:
sudo mount -o offset=32256,loop buildroot.img temp

It can be converted to a vmware disk like this:
qemu-img convert buildroot.img -O vmdk buildroot.vmdk

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080429/7a0b6716/attachment.htm 
