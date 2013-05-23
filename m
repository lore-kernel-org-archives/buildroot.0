From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 23 May 2013 07:49:41 -0700
Subject: [Buildroot] [PATCH 4/5] portaudio: add license information
In-Reply-To: <20130523073314.GE3373@free.fr>
References: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
 <1369268647-13128-4-git-send-email-gilles.talis@gmail.com>
 <20130523065904.GD3373@free.fr> <20130523070918.GG25186@sapphire.tkos.co.il>
 <20130523073314.GE3373@free.fr>
Message-ID: <CAKcgs2xMftxoEre342YqJkmnRkgvuW=Prm=HYiyG2JiBCd9wJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Baruch, all

2013/5/23 Yann E. MORIN <yann.morin.1998@free.fr>:
> Baruch, All,
>
> On 2013-05-23 10:09 +0300, Baruch Siach spake thusly:
>> On Thu, May 23, 2013 at 08:59:04AM +0200, Yann E. MORIN wrote:
> [--SNIP--]
>> > This is not really MIT, since there is additional text:
>> >
>> >  ---8<---
>> >  * The text above constitutes the entire PortAudio license; however,
>> >  * the PortAudio community also makes the following non-binding
>> >  * requests:
>> >  *
>> >  * Any person wishing to distribute modifications to the Software is
>> >  * requested to send the modifications to the original developer so that
>> >  * they can be incorporated into the canonical version. It is also
>> >  * requested that these non-binding requests be included along with the
>> >  * license above.
>> >  ---8<---
>> >
>> > So I'd say:
>> >     PORTAUDIO_LICENSE = portaudio license (MIT-like plus special clause)
>> >
>> > (which by the way makes it non-free software.)
>>
>> Well, the text you cite says explicitly that these are "non-binding requests".
>> Would you still consider this non-free?
>
> Well, I poundered that, yes. But the way it is phrased is dubious.
>
> First, it states that it is a non-binding clause. But then the clause
> states "[a]ny person [doing changes] is requested to send modifications
> [upstream]." The term "requested" is a bit strong for a non-binding
> clause.
>
> So, let me rephrase:
>     (which by the way *may* make it non-free software.)
>
> But the final word should come from a legal counsel, of course. :-)
>
> Anyway, this is not "MIT" per-se.
>
> Regards,
> Yann E. MORIN.

I actually had the same assumption as Baruch. I felt like the
"non-binding requests" was the most important information in the text.
Anyway, as you say, let's wait for a license expert to give final word
on this.
I'll send a patch later when we get confirmation that license type
needs to be modified.

Thanks
Regards,
Gilles.
