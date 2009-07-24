From: Maxim Grigoriev <maxim@tensilica.com>
Date: Fri, 24 Jul 2009 10:31:45 -0700
Subject: [Buildroot] [git commit] CHANGES: add #163 + #473
In-Reply-To: <87r5w6ur50.fsf@macbook.be.48ers.dk>
References: <20090724055230.2080B77660@busybox.osuosl.org>	<20090724110230.3f51597a@surf>
	<87zlauutcd.fsf@macbook.be.48ers.dk>	<20090724153528.7103ad9d@surf>
	<87r5w6ur50.fsf@macbook.be.48ers.dk>
Message-ID: <4A69F001.9020304@tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Thomas> I'm concerned by the licensing of
 Thomas> target/xtensa/xt-buildroot-overlay-install, since this file
 Thomas> states:

 Thomas> +# Copyright (c) 2003-2008 by Tensilica Inc. ALL RIGHTS
 Thomas> +RESERVED.  # These coded instructions, statements, and
 Thomas> +computer programs are the # copyrighted works and
 Thomas> +confidential proprietary information of Tensilica Inc.

>> Yes, that doesn't fly with the GPL requirements. Maxim, is it OK with
>> you to get rid of that header?

Absolutely. I am sorry for any inconvenience.

-- Maxim

Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>>>>>>             
>
> Hi,
>
>  >> I agree that the xtensa stuff is "special" in various ways, but I
>  >> think it's more productive to get it into git and then work on
>  >> getting it cleaned up more, instead of having it gather dust in
>  >> bugzilla.
>
>  Thomas> Ok, fair enough. Reading the patches again, they don't look
>  Thomas> too invasive after all.
>
> No, it is pretty much self contained.
>
>  Thomas> I'm concerned by the licensing of
>  Thomas> target/xtensa/xt-buildroot-overlay-install, since this file
>  Thomas> states:
>
>  Thomas> +# Copyright (c) 2003-2008 by Tensilica Inc. ALL RIGHTS
>  Thomas> +RESERVED.  # These coded instructions, statements, and
>  Thomas> +computer programs are the # copyrighted works and
>  Thomas> +confidential proprietary information of Tensilica Inc.
>
> Yes, that doesn't fly with the GPL requirements. Maxim, is it OK with
> you to get rid of that header?
>
>  Thomas> BTW, was Perl already a host dependency to run Buildroot ?
>
> Well, it is indirectly as you need Perl to build Linux + a number of
> packages, but nothing in buildroot self was using Perl.
>
>   
