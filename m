From: Laurent Joli <l.joli@expemb.com>
Date: Wed, 27 May 2015 11:20:52 +0200
Subject: [Buildroot] sky2 not created
In-Reply-To: <20150527105234.76b1512a@free-electrons.com>
References: <CAJtzDg-NoVNk_W8CnV0y0sY+dhZNCKTu66tfePnyUoDNj+bTeg@mail.gmail.com>
 <20150527094643.0dcb2107@free-electrons.com>
 <CAJtzDg9LiZjeTJcRXp=Eng8kfynfDjdYrtKD=kVJ=GJjuGobWg@mail.gmail.com>
 <20150527101333.1c2f6137@free-electrons.com>
 <CAJtzDg9TN7oH0owqeRu32p_=u=gtrjbwcAVjWabsO6=R+VT7tA@mail.gmail.com>
 <20150527103020.0aec65d2@free-electrons.com>
 <CAJtzDg8wS89HmskSNaB60NkOZgg-WQoYGmQtmJGVa3zJHDuBCA@mail.gmail.com>
 <20150527105234.76b1512a@free-electrons.com>
Message-ID: <CAJtzDg85zxiYo7ntyHS_=pGorTyMjaR=zogDRdy_NaxWZKHikg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, I see now.

But When I boot with this rootfs ( ext2 ) on my board, I have :

buildroot login: root
#
#
# lsmod
Module                  Size  Used by    Not tainted
# modprobe sky2
modprobe: module sky2 not found in modules.dep


Thanks you,
Laurent

2015-05-27 10:52 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Laurent Joli,
>
> On Wed, 27 May 2015 10:35:26 +0200, Laurent Joli wrote:
>
> >
> .-(/media/ljoli/disk_one/buildroot/buildroot-2015.05-rc3/output/build/linux-9bafbcba67f7bb2a48a5e05998cecb1165aa444f)----------------------------------------------------------------------------------------------------(ljoli at ljoli-MS-7823
> > )-
> > `--> grep SKY2 .config
> > CONFIG_SKY2=y
> > CONFIG_SKY2_DEBUG=y
>
> So the driver is configured to be compiled statically in your kernel,
> which explains why you don't have a kernel module generated.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150527/73f6517b/attachment.html>
