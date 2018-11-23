From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 09:07:42 +0100
Subject: [Buildroot] [PATCH] perl-time-hires: remove it
In-Reply-To: <20181122182215.17910-1-francois.perrad@gadz.org>
References: <20181122182215.17910-1-francois.perrad@gadz.org>
Message-ID: <20181123090742.68155c7c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Nov 2018 19:22:15 +0100, Francois Perrad wrote:
> this is a core module (ie. included in the Perl distribution)
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                                   |  1 -
>  package/Config.in                            |  1 -
>  package/perl-time-hires/Config.in            | 10 ----------
>  package/perl-time-hires/perl-time-hires.hash |  6 ------
>  package/perl-time-hires/perl-time-hires.mk   | 14 --------------
>  5 files changed, 32 deletions(-)
>  delete mode 100644 package/perl-time-hires/Config.in
>  delete mode 100644 package/perl-time-hires/perl-time-hires.hash
>  delete mode 100644 package/perl-time-hires/perl-time-hires.mk

We need Config.in.legacy handling when removing packages/options.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
