From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Feb 2014 11:46:39 +0100
Subject: [Buildroot] [PATCH] trivial: update buildroot e-mail address to
	buildroot@buildroot.org
In-Reply-To: <20140211211115.GC3411@free.fr>
References: <5dc9b6320a27725abc62.1392150183@argentina>
 <20140211211115.GC3411@free.fr>
Message-ID: <CAAXf6LW_nWV1sAh0F9s_zq3_oEZo0z=k39Bvd_Gyq=VgDiVQvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Feb 11, 2014 at 10:11 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[..]
>> diff --git a/Makefile b/Makefile
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1,7 +1,7 @@
>>  # Makefile for buildroot
>>  #
>>  # Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
>> -# Copyright (C) 2006-2014 by the Buildroot developers <buildroot@uclibc.org>
>> +# Copyright (C) 2006-2014 by the Buildroot developers <buildroot@buildroot.org>
>
> I'd keep the original line, since it was the email adress at that time,
> and would add a new line:
>     # Copyright (C) 2006-2014 by the Buildroot developers <buildroot@uclibc.org>
>     # Copyright (C) 2014 by the Buildroot developers <buildroot@buildroot.org>

Ok, thanks, I'll send an updated version.

>
>> diff --git a/docs/copyright.txt b/docs/copyright.txt
>> --- a/docs/copyright.txt
>> +++ b/docs/copyright.txt
>
> I read that file for the first time tonight. It is hilarious! :-)

It is! I wonder how many core developers actually are aware of this...

Best regards,
Thomas
