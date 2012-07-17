From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 17 Jul 2012 17:18:42 +0200
Subject: [Buildroot] [PATCH v4 00/22] Automatically produce legal
 compliance info
In-Reply-To: <50057FC8.7070905@free-electrons.com>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
 <20120716175524.4ecb6b99@skate>
 <CAAXf6LXQVpMO0n8R-__zRro=3_+RjFowATsfZtqj3PcPDf_q8w@mail.gmail.com>
 <50057FC8.7070905@free-electrons.com>
Message-ID: <CAHXCMMKuC=w1X+3yWp4FNwkT_9=53Ad913YfKpXdNTPBe=W+4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/17 Maxime Ripard <maxime.ripard@free-electrons.com>:
> Le 17/07/2012 16:55, Thomas De Schampheleire a ?crit :
>> Op 16 jul. 2012 09:55 schreef "Thomas Petazzoni" <
>> thomas.petazzoni at free-electrons.com> het volgende:
>>>
>>> Le Thu, 17 May 2012 19:32:59 +0200,
>>> Luca Ceresoli <luca@lucaceresoli.net> a ?crit :
>>>
>>>> here is the third version of the legal-info feature implementation.
>>>>
>>>
>>> Ok, this series has been around for a while. I think that the overall
>>> idea has been accepted by everybody, and has been discussed during the
>>> Buildroot Developers Meeting in February.
>>>
>>> Even though I think there might be a few possibilities to make the code
>>> a bit nicer in patch 01/22, that's only internal implementation details
>>> that can be improved at a later point.
>>>
>>> Therefore, I'm now hesitating between those two solutions:
>>>
>>>  (1) Pulling all this in the current master, so that it will be part of
>>>      the next 2012.08 release. The chance of breaking seems fairly
>>>      limited to me, and this code has been around for a while, and I'd
>>>      like us to make progress on this.
>>>
>>>  (2) Be a bit safer, and wait the end of July to merge this into the
>>>      -next branch, once 2012.08-rc1 has been released.
>>>
>>> What's the community opinion on this? At the moment, I'm leaning
>>> towards (1), but I'd like to hear others opinion on this.
>>
>> I'd go for (1). As you say, chances of breaking something is small. Plus,
>> if we can get this into the August release, we'll start getting further
>> feedback right away instead of waiting another three months.
>
> Agreed.
> I'd go for (1) too.

I second (1) too.


-- 
Sam
