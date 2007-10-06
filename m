From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 6 Oct 2007 22:15:36 +0200
Subject: [Buildroot] Adding Cirrus  EP93XX  ARM to buildroot
In-Reply-To: <003c01c8063e$26e48a70$b07ee255@atmel.com>
References: <20071003204012.GE20951@aon.at> <47041DC1.8020301@promwad.com>
	<003c01c8063e$26e48a70$b07ee255@atmel.com>
Message-ID: <20071006201536.GH20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 04, 2007 at 06:08:55AM +0200, Ulf Samuelsson wrote:
>> 
>>> Depends a bit.. From the sounds, all but the configs should reside in
>>> generic parts.
>>> That said, I'm not too keen on building up a shadow of kernel.org, so
>>> please
>>> 1) update your patches against current linus tree (or -mm, however you
>>> see fit)
>>> 2) submit your patches upstream
>> 
>> Bernhard,
>> 
>> Let me not argee here. You are forcing "keep up-to-date" policy instead of
>> "stable release" policy.

How so? I'm asking that you submit your patches to the respective
upstream maintainers for review and later inclusion.

>> Cirrus Patches may be not a part of buildroot but refer as URL on Cirrus web site.

This is an entirely different thing.

>> In embedded world is it often that you have to stick to some old kernel version because
>> of dependency on 3rd components specific to that particular kernel version.
>> 
>> Take into account reasoning of usual linux developer - I do not want to update my kernel
>> patches for every (month,week) -mm released. I want to have a stable base - which remains stable
>> after half-of-year.
>> 
>> And submitting patches to mainstream takes long time. And we want Cirrus support now.

Supporting some old version of packages with supplemental patches is
fine and one thing. Refusing even try to get your additions merged is
not a proper thing to do IMO.

It is extremely burdensome and impractical to have to patch every single
"new" upstream release (let alone time-consuming and thus probably
expensive if somebody pays the time you're spending on doing it).

>> Best regards,
>> Ivan

>Bernard wants you to freeze the buildroot source code for a specific customer.

Ulf, please stop to babble such crap. There is /dev/null for such
insults. Thank you.
