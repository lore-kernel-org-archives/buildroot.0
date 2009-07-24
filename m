From: Maxim Grigoriev <maxim@tensilica.com>
Date: Fri, 24 Jul 2009 10:29:46 -0700
Subject: [Buildroot] [git commit] CHANGES: add #163 + #473
In-Reply-To: <20090724153528.7103ad9d@surf>
References: <20090724055230.2080B77660@busybox.osuosl.org>	<20090724110230.3f51597a@surf>
	<87zlauutcd.fsf@macbook.be.48ers.dk> <20090724153528.7103ad9d@surf>
Message-ID: <4A69EF8A.5080802@tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm concerned by the licensing of
target/xtensa/xt-buildroot-overlay-install, since this file states:

+# Copyright (c) 2003-2008 by Tensilica Inc. ALL RIGHTS RESERVED.
+# These coded instructions, statements, and computer programs are the
+# copyrighted works and confidential proprietary information of Tensilica Inc.
+# They may not be modified, copied, reproduced, distributed, or disclosed to
+# third parties in any manner, medium, or form, in whole or in part, without
+# the prior written consent of Tensilica Inc.

This one has to be fixed, of course.

If you can, please, simply remove the copyright I'd really appreciate it.

I don't hove a write-access to Buildroot.

-- Maxim

Thomas Petazzoni wrote:
> Le Fri, 24 Jul 2009 15:02:42 +0200,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
>
>   
>> Yes, they are committed and I haven't seen the mails either - seems
>> like the commit hook has issues when I push multiple changes at once.
>>
>> (Or it might be something else, I'm having mail and hw problems
>> today).
>>     
>
> I haven't seen the mails either. So not likely to be a problem on your
> side.
>
>   
>> I agree that the xtensa stuff is "special" in various ways, but I
>> think it's more productive to get it into git and then work on getting
>> it cleaned up more, instead of having it gather dust in bugzilla.
>>     
>
> Ok, fair enough. Reading the patches again, they don't look too
> invasive after all.
>
> I'm concerned by the licensing of
> target/xtensa/xt-buildroot-overlay-install, since this file states:
>
> +# Copyright (c) 2003-2008 by Tensilica Inc. ALL RIGHTS RESERVED.
> +# These coded instructions, statements, and computer programs are the
> +# copyrighted works and confidential proprietary information of Tensilica Inc.
> +# They may not be modified, copied, reproduced, distributed, or disclosed to
> +# third parties in any manner, medium, or form, in whole or in part, without
> +# the prior written consent of Tensilica Inc.
>
> BTW, was Perl already a host dependency to run Buildroot ?
>
> Sincerly,
>
> Thomas
>   
