From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 4 Dec 2017 08:58:22 +0300
Subject: [Buildroot] [PATCH 1/3] board/orangepi: add support for
 orangepi-pc-plus board
In-Reply-To: <20171203232528.237e3ec3@windsurf.home>
References: <20171108194334.10031-1-geomatsi@gmail.com>
 <20171108194334.10031-2-geomatsi@gmail.com>
 <20171203232528.237e3ec3@windsurf.home>
Message-ID: <20171204055822.hvwjezi2djv7jj34@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> On Wed,  8 Nov 2017 22:43:32 +0300, Sergey Matyukevich wrote:
> > This board is a variant of orangepi-pc board. It adds 8GB eMMC and Realtek
> > RTL8189FTV SDIO WiFi chip. This variant has a separate support in U-Boot
> > and kernel. So it makes sense to create a separate entry
> > for this board in buildroot.
> > 
> > Board support package includes the following components:
> >  - mainline u-boot 2017.09
> >  - mainline kernel 4.13.11
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> I've applied, after adding an entry to the DEVELOPERS file. One
> comment, though.
> 
> >  board/orangepi/orangepi-pc-plus/boot.cmd           |  8 +++++
> >  board/orangepi/orangepi-pc-plus/genimage.cfg       | 36 ++++++++++++++++++++
> >  .../orangepi/orangepi-pc-plus/linux-extras.config  |  8 +++++
> >  board/orangepi/orangepi-pc-plus/post-build.sh      |  1 +
> 
> This common post-build script only generates the U-Boot script. Could
> you move the boards that use this post-build script to instead use
> BR2_TARGET_UBOOT_BOOT_SCRIPT ?

Sure, will do this cleanup with orangepi/pcduino boards as soon as
I complete MacchiatoBin pieces.

Regards,
Sergey
