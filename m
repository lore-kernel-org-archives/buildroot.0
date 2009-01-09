From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Jan 2009 12:26:38 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable
	general patches
In-Reply-To: <1231451799.9711.13.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Thu\, 08 Jan 2009 22\:56\:39 +0100")
References: <200811140854.58814.markus.heidelberg@web.de>
	<87od0ijunz.fsf@macbook.be.48ers.dk>
	<200811151156.02393.markus.heidelberg@web.de>
	<200901081510.39837.markus.heidelberg@web.de>
	<878wplsw9q.fsf@macbook.be.48ers.dk>
	<1231451799.9711.13.camel@elrond.atmel.com>
Message-ID: <87mye0oh3l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> I can see a few alternatives.
 Ulf> 1) Get rid of the patches, and introduce the possibility 
 Ulf>    to select a prepatched version with these patches

I take it that's already there with your BR2_U_BOOT_SITE addition?

 Ulf> 2) Keep the patches and prune them once 
 Ulf>    they are in mainstream.
 Ulf>    I am only interested in maintaing one set of patches
 Ulf>    for one version, so as I mentioned before,
 Ulf>    I submitted about half a dozen patches the last two days
 Ulf>    and it looks like they can enter the main tree,
 Ulf>    with maybe a little rework.

We'll see how they are received, We'll need to get rid of them sooner
or later atleast.

 Ulf> 3) Do it the same way I did the Advanced Linux support
 Ulf>    Keep target/u-boot, but allow patches
 Ulf>    to be taken from the target/device/<whatever>
 Ulf>    In this case, the patches would go into 
 Ulf>    target/device/Atmel/arch-at91/u-boot-2009.01-rc1 

 Ulf> The last option is appealing.

Yes, or more generally - Provide more flexibility for the U-Boot/Linux
source, see my earlier mail.

-- 
Bye, Peter Korsgaard
