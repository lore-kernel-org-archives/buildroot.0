From: Joachim Nilsson <troglobit@gmail.com>
Date: Thu, 04 Jun 2020 20:51:39 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Change from FTP to HTTP for
 official releases
In-Reply-To: <87sgfa65ce.fsf@tarshish>
Message-ID: <C38JLNMUKWQ8.JGLZN19PJI6G@luthien>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu Jun 4, 2020 at 11:41 PM CEST, Baruch Siach wrote:
> On Thu, Jun 04 2020, Joachim Nilsson wrote:
> > -UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
> > +UBOOT_SITE = http://ftp.denx.de/pub/u-boot
> This URL redirects to https. Better use https directly.

Argh!  Thanks for taking the time to audit this, Baruch! :)
I'll send a v2 patch shortly.

Regards
 /Joachim
