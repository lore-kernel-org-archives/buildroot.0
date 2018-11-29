From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:15:55 +0100
Subject: [Buildroot] [PATCH] perl-time-hires: remove it
In-Reply-To: <68d8e298-7309-c2b0-4002-0d1a4581b3e4@mind.be>
References: <20181122182215.17910-1-francois.perrad@gadz.org>
 <20181123090742.68155c7c@windsurf>
 <68d8e298-7309-c2b0-4002-0d1a4581b3e4@mind.be>
Message-ID: <20181129221555.208ac4e0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Nov 2018 17:54:18 +0100, Arnout Vandecappelle wrote:

>  No we don't. Config.in.legacy handling is there to make sure that the user
> after upgrading Buildroot still has everything that she had enabled before. In
> this case, the Time::HiRes module *is* there because it is part of perl. So no
> legacy handling needed.

Indeed, thanks for pointing this out. I've applied the patch as-is.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
