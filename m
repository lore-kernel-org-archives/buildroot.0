From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Sep 2012 07:00:21 +0300
Subject: [Buildroot] [PATCH 1/2] dnsmasq: bump to version 2.63
In-Reply-To: <87ligp5zhe.fsf@macbook.be.48ers.dk>
References: <1346767658-7968-1-git-send-email-gustavo@zacarias.com.ar>
 <20120904180016.GC3768@tarshish>
 <87ligp5zhe.fsf@macbook.be.48ers.dk>
Message-ID: <20120905040020.GA3631@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Sep 04, 2012 at 10:01:33PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  >> +DNSMASQ_LICENSE = GPLv2 GPLv3
> 
>  Baruch> Looks confusing. Is it "either v2 or v3"? If so, then I think
> 
>  Baruch> DNSMASQ_LICENSE = Dual GPLv2/GPLv3
> 
> Or even GPLv2+

The license text of Makefile, for example, is

#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; version 2 dated June, 1991, or
#  (at your option) version 3 dated 29 June, 2007.

Note that there is no "or later" in the license description. I guess this 
means "GPL v2 or v3 only".

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
