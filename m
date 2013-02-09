From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 09 Feb 2013 13:45:39 +0200
Subject: [Buildroot] [PATCH] aircrack-ng: new package
In-Reply-To: <511634BB.4000506@petroprogram.com>
References: <1360340189-4409-1-git-send-email-laurent.cans@gmail.com>
 <511525D1.8010305@petroprogram.com>
 <CAA1eMkEu3DZTbtgjZgq3538N5dyE5g84NDDL4_ay6OQ7Ek4-eA@mail.gmail.com>
 <511634BB.4000506@petroprogram.com>
Message-ID: <511636E3.5010909@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

9.2.2013 13:36, Stefan Fr?berg kirjoitti:
> Hi Laurent
>
> 9.2.2013 0:38, Laurent CANS kirjoitti:
>> 2013/2/8 Stefan Fr?berg <stefan.froberg@petroprogram.com>:
>>> Hi Laurent
>>>
>>> You mean 1.1 did not compile with latest buildroot ?
>> I faced a problem with gcc4.5 referenced by the project with this issue :
>>
>> http://trac.aircrack-ng.org/ticket/762

Ah, but now I see it.
That -Werror thing.
I always define -Wno-error in my buildroot CFLAGS because
I hate it when people think that their code is perfect (it newer is, and
neither is my code) and
stop compiling because warnings.
That's why my compilationg with 4.5 succeeded.

So lil patch to makefile to get rid of that Werror thing should be good
to get it compiled
with any gcc.


Regards
Stefan


> Hmmm... I could swear that I was using 4.5  when compiling that 1.1
> version ages ago. But i tried compiling
> it with only 32-bit x86 target.
>
> Regards
> Stefan
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
