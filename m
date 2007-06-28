From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 29 Jun 2007 00:38:27 +0200
Subject: [Buildroot] PATCH: Clear package config build warnings on newer
	GCC's
In-Reply-To: <090a01c7b9d1$cc9579c0$6e02a8c0@k2>
References: <059401c7b819$e2c1e6c0$6e02a8c0@k2> <20070626180913.GE4096@aon.at>
	<061701c7b821$b2450dd0$6e02a8c0@k2> <20070626192757.GF4096@aon.at>
	<090a01c7b9d1$cc9579c0$6e02a8c0@k2>
Message-ID: <20070628223827.GI4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 28, 2007 at 05:14:59PM -0500, Rick Foos wrote:
>Missed one merge fix. In the current tree, make defconfig no longer works.

Thanks for the hint. Merged as r18968. Thanks!
>
>Cheers,
>Rick
>
>----- Original Message ----- 
>From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
>To: "Rick Foos" <rick@synchromeshcomputing.com>
>Sent: Tuesday, June 26, 2007 2:27 PM
>Subject: Re: [Buildroot] PATCH: Clear package config build warnings on 
>newer GCC's
>
>
>>On Tue, Jun 26, 2007 at 01:42:05PM -0500, Rick Foos wrote:
>>>Sorry, missed that one.
>>>
>>>Was the provided patch file incorrect for buildroot specific changes?
>>
>>If you touch package/config/*, then please make a clean copy of the
>>pristine thing from the kernel (e.g. from 2.6.21.5) and incooperate
>>buildroot specific changes which you keep as a .diff in that very same
>>directory, along the patched source.
>>
>>See?
>>
>>It is not worthwhile to hack the old version that we currently use. It
>>works, but if you touch it, you're better off to update it before doing
>>anything else.
>>
>>thanks,
>>>
>>>Rick
>>>
>>>----- Original Message ----- 
>>>From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
>>>To: "Rick Foos" <rick@synchromeshcomputing.com>
>>>Cc: "Buildroot" <buildroot@uclibc.org>
>>>Sent: Tuesday, June 26, 2007 1:09 PM
>>>Subject: Re: [Buildroot] PATCH: Clear package config build warnings on
>>>newer GCC's
>>>
>>>
>>>>On Tue, Jun 26, 2007 at 12:46:11PM -0500, Rick Foos wrote:
>>>>>Watching all the warnings on package/config finally got to me.
>>>>>
>>>>>A patch that clears the gcc warnings from config with cast changes only.
>>>>>
>>>>>thanks, I feel better now,
>>>>
>>>>:)
>>>>
>>>>A few days ago, i said:
>>>>i wouldn't mind if we would pull the lxdialog from the current kernel,
>>>>fwiw. patches welcome
>>>>Lta, if you do this, please also provide a diff with the buildroot
>>>>specific changes, so we can easily pull upstream changes
