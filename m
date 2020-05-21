From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 21 May 2020 10:50:29 +0200
Subject: [Buildroot] Console warning using the package aircrack-ng
In-Reply-To: <20200521095344.264f72dc@gmx.net>
References: <CALtfCQYSupq9++U=Ua74Y3aT5Z7pxzHcEmERW-D-je3ZPGZG3w@mail.gmail.com>
 <20200520190957.115bcdfb@gmx.net>
 <CALtfCQbha192QTuWxfQESzsfFAsJu=q7bKESB7roG53E4awssA@mail.gmail.com>
 <20200521095344.264f72dc@gmx.net>
Message-ID: <CALtfCQb96X+zfDrxT+K3HECy=fGgmUJjOpWoEMec1OqM89r-7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> For the installed system (and per login account):
>
>         $  echo "export LANG=en_US.utf8" > ~/.profile
>
> or /etc/profile for all accounts...
>
> For the next build take a look at the BR2_ROOTFS_OVERLAY option ([1])...
>
> Regards,
> Peter
>
> [1] http://nightly.buildroot.org/manual.html#rootfs-custom

Super easy, it worked perfectly. Thanks.

Oscar Gomez Fuente
