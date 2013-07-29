From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 21:24:15 +0200
Subject: [Buildroot] [PATCH] add support for Freescale .sb format to
 uboot
In-Reply-To: <CAEnpE0yzcer9dNew-6yfwmjf+L+a=Kgrf-tZ++Y2gMRcwmGYLw@mail.gmail.com>
References: <CAEnpE0yzcer9dNew-6yfwmjf+L+a=Kgrf-tZ++Y2gMRcwmGYLw@mail.gmail.com>
Message-ID: <20130729212415.15f40bcf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Coulbourne,

On Wed, 5 Dec 2012 11:48:27 -0500, Gary Coulbourne wrote:
> This patch offers the option to build u-boot.sb
> 
> ---
>  boot/uboot/Config.in |    4 ++++
>  boot/uboot/uboot.mk  |    3 +++
>  2 files changed, 7 insertions(+)

Applied, thanks. I had to add the host-elftosb dependency to make it
work properly.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
