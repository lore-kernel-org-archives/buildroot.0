From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 9 Jun 2015 16:04:08 +0200
Subject: [Buildroot] Kernel zImage under 1MB
In-Reply-To: <CADMiy=KWH-W4VGUjaMF8mmFTSRUxT13xbTeoWigo=gme8GDwKw@mail.gmail.com>
References: <CADMiy=KWH-W4VGUjaMF8mmFTSRUxT13xbTeoWigo=gme8GDwKw@mail.gmail.com>
Message-ID: <CAGm1_ksTzLFdBJuezjs=774Zx_sMoTnaiWQJDQqYsxd0B6jS4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 9, 2015 at 3:17 PM, Michal Gonda <gonda.miso@gmail.com> wrote:
> Hi guys,
>
> I am trying to build minimal kernel under 1 Mb with Buildroot. It is
> intended for small board with qspi memory and basic functionality, ethernet,
> usb, spi, and some GPIO's. Basic terminal access via ssh and UART. My first
> thoughts are if it is even possible to modify kernel .config via
> linux-menuconfig to reach this size.
>
> Also if it is possible to identify the redundant parts without deep
> knowledge about kernel architecture and exclude them from compilation.
>
> If someone can direct me to good direction how to solve this problem or even
> specify some tools and ways how to do it would be very helpful.

Take a look at this project: https://tiny.wiki.kernel.org/

Yegor
