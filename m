From: Thomas Lundquist <lists@zelow.no>
Date: Fri, 9 Jan 2009 12:07:56 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to
	disable	general patches
In-Reply-To: <1231451799.9711.13.camel@elrond.atmel.com>
References: <200811140854.58814.markus.heidelberg@web.de>
	<87od0ijunz.fsf@macbook.be.48ers.dk>
	<200811151156.02393.markus.heidelberg@web.de>
	<200901081510.39837.markus.heidelberg@web.de>
	<878wplsw9q.fsf@macbook.be.48ers.dk>
	<1231451799.9711.13.camel@elrond.atmel.com>
Message-ID: <20090109110755.GA14343@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 08, 2009 at 10:56:39PM +0100, Ulf Samuelsson wrote:
> 
> 3) Do it the same way I did the Advanced Linux support
>    Keep target/u-boot, but allow patches
>    to be taken from the target/device/<whatever>
>    In this case, the patches would go into 
>    target/device/Atmel/arch-at91/u-boot-2009.01-rc1 
>  
> The last option is appealing.

I like that approach. (Except the versioning of course :=)

But not sure how to make this work without too much hassle.


Thomas.
