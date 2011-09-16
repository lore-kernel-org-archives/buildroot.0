From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 16 Sep 2011 09:30:03 +0200
Subject: [Buildroot] Q
In-Reply-To: <808391316157931@web42.yandex.ru>
References: <808391316157931@web42.yandex.ru>
Message-ID: <CAGm1_kt6gGQ+m1=C+C_EU01S2FJrYvmYw2f+XYbnhBCxgzGGdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex,

> If i upload?BuildRoot?to my embedded board,?support?isa,usb and other
> interface drivers?available?

this has nothing to do with buildroot. It is just your kernel
configuration. Execute make linux-menuconfig and select needed drivers
as in your BSP.

Yegor
