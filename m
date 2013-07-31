From: zhou qiang <zhouqiang.search@gmail.com>
Date: Wed, 31 Jul 2013 23:03:18 +0800
Subject: [Buildroot] How to login as root without password
In-Reply-To: <CAAXf6LVa_tJZG8CQw2zUUdyOvMd7TAs5yfdtUtjKG5bcGqhdZw@mail.gmail.com>
References: <CAHbR41VH17_qSe3T92b=n61_f1a_64jVXy5rNCKaexajmWzt9g@mail.gmail.com>
 <CAAXf6LXRYRvhWwE-TnM2fnGPMp+s+eEa3oUQtwdatMPxP=vAyA@mail.gmail.com>
 <CAHbR41WGQDmkVy4TguM7KEO9hf6NpND=wQ1CiUWMgUwhWQRkiQ@mail.gmail.com>
 <CAAXf6LVa_tJZG8CQw2zUUdyOvMd7TAs5yfdtUtjKG5bcGqhdZw@mail.gmail.com>
Message-ID: <CAHbR41Xzw1RsrR8ZykwvWjXyP_GKzQRWghTo0hjq2z=sPGsabQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi , Thomas

We have an internal jffs2 image making process , which requires a pure
target from buildroot ,
and follow the steps as below :

(1) extract rootfs.tar to designated target directory (rootfs) , this is
done by post-script .
(2) Adding functional script and application to rootfs .
(3) make a new jffs2 image
(4)burn this image to arm board

Of course , if extract rootfs.tar as root , everything works pretty well ,
busybox login as root .
But in the server , there is no root permission .

So the issue is how to login as root without "operation of extract
rootfs.tar as root".


Regards ,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130731/b39c5319/attachment.html>
