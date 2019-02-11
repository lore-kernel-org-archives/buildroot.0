From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 22:29:53 +0100
Subject: [Buildroot] [PATCH v2 0/4] WPE WebKit
In-Reply-To: <20190205204152.10376-1-francois.perrad@gadz.org>
References: <20190205204152.10376-1-francois.perrad@gadz.org>
Message-ID: <20190211222953.5a37a600@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Feb 2019 21:41:48 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Francois Perrad (4):
>   libwpe: new package
>   wpebackend-fdo: new package
>   wpewebkit: new package
>   cog: new package

Thanks, I have applied the series to the next branch. I did a few
adjustements, mainly on cleaning up the comments next to the depends
on, but also adding a few missing depends on, and more importantly,
fixing a serious typo in the wpewebkit package (which was reported by
check-package).

I'll reply to the individual patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
