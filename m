From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 10:31:13 +0200
Subject: [Buildroot] [PATCH] gst-fsl-plugins: fix build for kernel
 headers >= 3.10
In-Reply-To: <1406352870-9607-1-git-send-email-bisson.gary@gmail.com>
References: <1406352870-9607-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140727103113.4dba3cb4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Fri, 25 Jul 2014 22:34:30 -0700, Gary Bisson wrote:
> This package couldn't build using a toolchain with kernel headers >=
> 3.10 because of the use of VIDIOC_DBG_G_CHIP_IDENT. As stated in
> videodev2.h, this ioctl should never be used.
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
