From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 17:22:08 +0100
Subject: [Buildroot] [PATCH 00/14] Add support for U-Boots Kbuild &
 Kconfig build system
In-Reply-To: <20141221234006.311fcde0@free-electrons.com>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
 <20141221234006.311fcde0@free-electrons.com>
Message-ID: <20150102172208.7a2ef5f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg,

On Sun, 21 Dec 2014 23:40:06 +0100, Thomas Petazzoni wrote:

> Thanks for working on this, definitely good to see someone tackling the
> bump to the first kconfig-enabled U-Boot version.
> 
> There is however one big issue with your patch series: I believe it
> breaks backward compatibility with U-Boot versions older than 2014.10.
> And a *lot* of people are using old versions of U-Boot, to which they
> are stuck due to the old version being their only choice for a given
> piece of hardware.
> 
> So we clearly need to continue to support older versions of U-Boot,
> that don't have the kconfig stuff. I just gave a try, and it seems like
> the old U-Boot way of configuring/building things apparently still
> works with U-Boot 2014.10. So your PATCH 01/14 is probably OK. However
> starting from 02/14, I believe you'll be breaking things for U-Boot
> versions older than 2014.10.
> 
> Can you work on a solution that preserves compatibility?

Since I had no feedback about this (probably due to the winter
holidays), I'll mark those patches as "Changes Requested" in patchwork.
Can you resend a new version that takes into account the need for
backward compatibility with older versions of U-Boot?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
