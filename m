From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Dec 2012 18:05:33 +0100
Subject: [Buildroot] [PATCH] add support for Freescale .sb format to
 uboot
In-Reply-To: <CAEnpE0yzcer9dNew-6yfwmjf+L+a=Kgrf-tZ++Y2gMRcwmGYLw@mail.gmail.com>
References: <CAEnpE0yzcer9dNew-6yfwmjf+L+a=Kgrf-tZ++Y2gMRcwmGYLw@mail.gmail.com>
Message-ID: <20121205180533.71706c56@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Coulbourne,

On Wed, 5 Dec 2012 11:48:27 -0500, Gary Coulbourne wrote:
> This patch offers the option to build u-boot.sb

We had a patch sent in March this year adding support for u-boot.sb:

[Buildroot] [PATCH 2/2] u-boot: add support for u-boot.sb file format

It was more complete than this one, because it included the dependency
on host-elftosb, which is needed to bring the elftosb tool built by
Buildroot before U-Boot uses it to generate the .sb image.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
