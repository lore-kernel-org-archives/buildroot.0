From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 16:11:45 +0100
Subject: [Buildroot] [PATCH RESEND] package/icu: bump to version 68-1
In-Reply-To: <2714898.iCvar5HTIS@diego> ("Heiko =?utf-8?Q?St=C3=BCbner=22'?=
 =?utf-8?Q?s?= message of "Mon, 23 Nov 2020 15:25:56 +0100")
References: <20201123100751.4095539-1-heiko@sntech.de>
 <87y2istgcb.fsf@dell.be.48ers.dk> <2714898.iCvar5HTIS@diego>
Message-ID: <87tutgt8em.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko St?bner <heiko@sntech.de> writes:

Hi,

 >> There is quite some pending patches. It would be good to explicitly mark
 >> it as a security fix, E.G. 'package/icu: security bump to version 68-1',
 >> to make sure it isn't missed for master, as package bumps otherwise now
 >> only go to next as we are busy getting 2020.11 stablized and released.
 >> 
 >> How much have you tested this? New icu releases unfortunately have a
 >> tendency to cause various breakage? Would it be an option to backport
 >> this fix to the 67-1 release for 2020.11 / 2020.02 and only bump to 68-1
 >> for next?

 > This is running on a device we're doing right now as part of qt5 and a qt5
 > main application for a week now (on a buildroot 2020.05-base) and I didn't
 > hear about any specific hickups so far.

Ok.

 > But while re-researching the CVE I noticed that it (now) marks 66.1 as up-to
 > affected - I do remember reading 67.1 there [0] before, though don't have
 > proof that it's not just my eyes ;-) .

heh ;)

 > So the 67.1 in buildroot is actually secure and doesn't need an update.

Except for 2020.02.x, which has 65-1. I'll fix that.

 > So I'll re-send this as v2 without the security-related text then ;-) .

Great, thanks!

-- 
Bye, Peter Korsgaard
