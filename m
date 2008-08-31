From: Steven Woody <narkewoody@gmail.com>
Date: Sun, 31 Aug 2008 09:59:11 +0800
Subject: [Buildroot] Make error
In-Reply-To: <ed4892840808301750t13e320a6ne218b2a0e96168f@mail.gmail.com>
References: <ed4892840808301750t13e320a6ne218b2a0e96168f@mail.gmail.com>
Message-ID: <ed4892840808301859s363bdcc5t5e821e5f6a868aec@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 31, 2008 at 8:50 AM, Steven Woody <narkewoody@gmail.com> wrote:
> Following were outputed when run 'make', but I don't know what step it
> is related to:
>
> table='target/generic/mini_device_table.txt'
> makedevs: line 53: regular file '/home/narke/buildroot/project_build_arm/uclibc/
> root/usr/share/udhcpc/default.script' does not exist: No such file or directory
> -rw-r--r-- 1 narke users 10530816 2008-08-31 08:47 /home/narke/buildroot/binarie
> s/uclibc/rootfs.arm.ext2
> rm -f /home/narke/buildroot/project_build_arm/uclibc/.fakeroot*
>
>
> Do you know what's wrong with the making?
>
> Thanks.
>

I now attach my .config for your reference.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: _config
Type: application/octet-stream
Size: 15661 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080831/e7257b97/attachment.obj 
