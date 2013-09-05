From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 5 Sep 2013 10:15:56 +0100
Subject: [Buildroot] [pull request] webkit: Version bump to 1.11.5
In-Reply-To: <20130905110143.55467e66@skate>
References: <CAG2jQ8gLL4NdmHcFA=ELMbFfHY1oGPGaXkvSaPk66sesh-0+6w@mail.gmail.com>
 <5227648E.7030304@mind.be> <20130905100121.4546cd3d@skate>
 <CAG2jQ8g2SYnbc5eqvhMnw-5=qQXj4K2q_aW4r70MRExdYjmpjw@mail.gmail.com>
 <20130905110143.55467e66@skate>
Message-ID: <CAG2jQ8ixCL2XKNGD1hMb3SkhmuPmppHCnVAWqMsyJH=Gh=yV1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 5 September 2013 10:01, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Thu, 5 Sep 2013 09:48:32 +0100, Markos Chandras wrote:
>
>> > A 1490 line patch is not so huge, I believe it should make it on the
>> > list, and if not, Peter will validate it manually. I agree that the
>> > overall patch should be sent to the list for review.
>>
>> Well, it's an upstream patch, so i don't think there is much to review
>> there but I can send it to the list anyway.
>
> It's not much to review this upstream patch, but rather the overall
> changes in webkit.mk and so on.

Oh sorry I thought you were referring just to the MIPS patch.

>
>> >>   Is there a reason why you cannot download the upstream patches with
>> >> WEBKIT_PATCH ?
>> >
>> > When it's possible, it's indeed a good idea.
>>
>> Unfortunately, I can't (or I don't think I can) use that. I had to
>> tweak the upstream patches a bit,
>> for example delete the changes in the ChangeLog files since they don't apply.
>> For other patches, I had to merge 2-3 upstream patches into a single
>> one in order to fix the problem completely instead of providing
>> separate patches with 1-2 line fixes.
>
> Ok. Since the patches are upstream, that's fine, since it means they
> will be removed at some point in the future.
>
> Thanks,
>

Yes that's true.  I will send the patch to the list.

-- 
Regards,
Markos Chandras
