From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 6 Aug 2019 23:05:44 +0200
Subject: [Buildroot] [PATCH 2/3] package/gpsd: requires NTP time hinting
 support
In-Reply-To: <20190806151411.69f45248@windsurf.home>
References: <20190806051921.28680-1-bernd.kuhls@t-online.de>
 <20190806051921.28680-2-bernd.kuhls@t-online.de>
 <20190806151411.69f45248@windsurf.home>
Message-ID: <5e73918e-4749-e30f-ebb7-57c1acce1489@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 8/6/19 3:14 PM, Thomas Petazzoni wrote:
> Hello Bernd,
> 
> Perhaps it would be nice to check with upstream if this is intended or
> not. Indeed, it is weird that they provide an option, but this option
> cannot be disabled. At first sight, it feels like the solution is to
> fix the build issue, rather than to always enable the option.

There is now a patch upstream in master 
https://gitlab.com/gpsd/gpsd/commit/8546be5f1eee36fd3fc66f09f2adfc18814d574c 
, but it does not seem to apply as is on 3.19.

> 
> Best regards,
> 
> Thomas
> 

Regards,

Titouan
