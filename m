From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 15 Apr 2016 11:23:36 +0200
Subject: [Buildroot] [PATCH 1/1] Add config to nfsd to set number of
 threads
In-Reply-To: <5710AFD9.4090709@gmx.de>
References: <1450381505-3796-1-git-send-email-universeII@gmx.de>
 <20151217200424.GC3653@free.fr> <567317AE.5060006@gmx.de>
 <20151217202555.GE3653@free.fr> <56B30C5E.2020702@gmx.de>
 <20160204205004.GB3468@free.fr> <56BDA67E.8060404@gmx.de>
 <56CF66D2.2080804@gmx.de> <56CF8EAF.407@mind.be> <5710A846.2080802@gmx.de>
 <5710ADB8.5010507@mind.be> <5710AFD9.4090709@gmx.de>
Message-ID: <5710B318.8080803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/15/16 11:09, Andreas Ehmanns wrote:
> Am 15.04.2016 um 11:00 schrieb Arnout Vandecappelle:
>>
>>
>> On 04/15/16 10:37, Andreas Ehmanns wrote:
>>> Am 26.02.2016 um 00:30 schrieb Arnout Vandecappelle:
>>>> On 02/25/16 21:40, Andreas Ehmanns wrote:
>>>>> Yann,
>>>>> is the patch o.k. for you? Shall I resend it using git?
>>>>   Yes, please send using git. Patches sent as attachments have an even bigger
>>>> chance of being ignored than other patches.
>>>>
>>>>   However, I can already say that it should be two separate patches: one
>>>> changing
>>>> "done" to OK/FAIL, and a second one doing the functional changes.
>>>>
>>>>   Regards,
>>>>   Arnout
>>>
>>> Yann, Arnout,
>>> can someone of you please check what happened with this patch? It's more than
>>> one month and a half ago that I sent it and it seems that it is still not
>>> incorporated?
>>
>>  We are unfortunately swamped with patches that need review, and we don't have
>> enough people doing reviews. And we're not willing to forego on quality by
>> accepting patches without review.
>>
>>  We will get to your patches eventually, because they are tracked in
>> patchwork. Note that the oldest pending patch is 9 months old, to give you an
>> idea of what you can expect.
>
> Arnout,
> I wasn't aware of that. So it seems that I was a little bit too impatient.

  I think your impatience is very reasonable. This point is discussed at about 
every buildroot developer meeting. Asking people to do more reviews is about the 
only thing we have come up with. If you have other ideas, feel free to launch them.

  Well, actually, we do have one other solution: the Buildroot Summer Camp, 
where a bunch of core developers come together for 4-5 days for a long hacking 
session. Last year we managed to get about 300 patches applied, and developed 
some important new features like the kernel-module infra, better support for 
systemd, ...



>
> Thanks for the clarification and I will have a look if I can follow your
> recommendation and review some patches.

  Thanks! That's really appreciated!

  Regards,
  Arnout

>
> Regards,
> Andreas
>
>>
>>
>>  What you can do to speed things up:
>>
>> - Help out with reviewing and testing. Look at some (non-trivial) patches that
>> are relevant to you (e.g. affecting a package that you use), download and test
>> it, then give it your Tested-by tag. You can also go over the changes, look
>> for any mistakes that you can identify, and give feedback or give it your
>> Reviewed-by tag. Obviously, your reviews will not immediately carry the same
>> weight as those of long-time buildroot developers, but they are really helpful.
>>
>> - Reply to your patches with 'ping', so they appear on the top of the stack
>> again. Note that this doesn't help that much because we're still swamped. But
>> it does at least tell us that you will be paying attention if we have any
>> feedback to give.
>>
>>
>>  Regards,
>>  Arnout
>>
>>> Is there something from my side what is missing?
>>>
>>> Additionally I sent a set of patches for the netsnmp init script one day before
>>> which are also not incorporated?
>>> Can you please have a look?
>>>
>>> Regards,
>>> Andreas
>>>
>>>>
>>>>> Please let me know.
>>>>>
>>>>> Regards,
>>>>> Andreas
>>>>>
>>>>> Am 12.02.2016 um 10:31 schrieb Andreas Ehmanns:
>>>>>> Yann,
>>>>>> indeed a killall -9 worked. So I reworked the patch. According to Thomas'
>>>>>> recommendation I added the OK/FAIL output as done in the dropbox init script.
>>>>>> Please have a look at the attached patch. If it's o.k., I'll resend it using
>>>>>> git.
>>>> [snip]
>>>>
>>>
>>
>

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
