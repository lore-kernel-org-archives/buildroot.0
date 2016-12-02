From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 22:35:00 +0100
Subject: [Buildroot] [PATCH] nodejs: security bump 0.10.x series to
	0.10.48
In-Reply-To: <8737i66npq.fsf@dell.be.48ers.dk>
References: <20161202201652.17515-1-peter@korsgaard.com>
 <20161202213645.3f866305@free-electrons.com>
 <8737i66npq.fsf@dell.be.48ers.dk>
Message-ID: <20161202223500.3619441c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 02 Dec 2016 22:11:13 +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:  
> 
>  > Hello,
>  > On Fri,  2 Dec 2016 21:16:52 +0100, Peter Korsgaard wrote:  
>  >> c-ares: fix for single-byte buffer overwrite, CVE-2016-5180, more
>  >> information at https://c-ares.haxx.se/adv_20160929.html  
> 
>  > Thanks. What about our c-ares package itself?  
> 
> That one was fixed quite some time ago:
> 
> commit 2d199dcff054d22a1ccc730fadfc7543b8c6e8f3
> Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Date:   Wed Oct 12 20:17:17 2016 -0300
> 
>     c-ares: security bump to version 1.12.0
> 
>     Fixes:
>     CVE-2016-5180 - ares_create_query single byte out of buffer write
> 
>     Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>     Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Ah, ok. Sorry, I didn't check that 1.12.0 fixed the issue. Thanks for
confirming.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
