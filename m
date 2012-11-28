From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 28 Nov 2012 22:46:12 +0100
Subject: [Buildroot] [PATCH 2/2] manual: autogenerate *-list.txt
In-Reply-To: <CAHXCMMLnsozMuVj6mzieSg6cpwgRNtoXZVO7_YGawqVODm-fJA@mail.gmail.com>
References: <1353544211-9308-1-git-send-email-s.martin49@gmail.com>
 <1353544211-9308-2-git-send-email-s.martin49@gmail.com>
 <50B29C3C.5090702@mind.be>
 <CAHXCMMLnsozMuVj6mzieSg6cpwgRNtoXZVO7_YGawqVODm-fJA@mail.gmail.com>
Message-ID: <CAHXCMMJOgLuyU15P80wcS4JH4qVhsokom7Oqs1juss6T3X0DAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/26 Samuel Martin <s.martin49@gmail.com>:
> Hi Arnout, all,
>
> 2012/11/25 Arnout Vandecappelle <arnout@mind.be>:
>> On 22/11/12 01:30, Samuel Martin wrote:
>>>
>>> I wonder whether the deprecated-list.txt file should be kept under
>>> scm; here I've just removed it and auto-generate it whenever the
>>> manual is built.
>>>
>>> It works well because the python script does not miss anything... so far.
>>>
>>> However, at the end, manual checking is still recommended.
>>>
>>> OTOH, keeping the deprecated-list.txt file under scm allows us to
>>> enforce synchronization between marking something as deprecated and
>>> the update of this list.
>>
>>
>>  I think these things should be kept under SCM.  Not just because manual
>> checking is recommended, but also because I don't like writing anything
>> outside
>> the output directory.  Some people may have the buildroot tree in a shared,
>> readonly location.
>
> Right, I forgot this use case.
> I'll rework it.
>

I've just post a rework of this serie, taking care this suggestion.
So, this patch can be dropped.

Regards,

-- 
Samuel
