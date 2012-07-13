From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 13 Jul 2012 23:57:15 +0200
Subject: [Buildroot] [PATCH v4 1/5] target: add symbols for i386/x86_64
 cpu features
In-Reply-To: <20120713232622.5a42e405@skate>
References: <1341528156-4197-1-git-send-email-s.martin49@gmail.com>
 <1341528156-4197-2-git-send-email-s.martin49@gmail.com>
 <4FFBC796.9030204@mind.be> <20120713232622.5a42e405@skate>
Message-ID: <CAHXCMMLQ483eb6w9OUi0ycwt=sFQBSkA8twNB237Coa2ZjHvsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2012/7/13 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Tue, 10 Jul 2012 08:11:34 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>>   I don't like these SSE4 configs which are not selected by anything.  I understand
>> that you need them for OpenCV, but it's not ideal.
>>
>>   Maybe we need an extra subarchitecture config option to explicitly enable these?
>
> Agreed, we should either have subarchitecture options that use those
> SSE4 options, or we should not add those SSE4 options, and only add
> them when those subarchitectures are added.
>
> Samuel, can you take this into account and respin the patch set?
Of course.

You prefer expressing dependencies using "depends on" keyword instead
"select", is it right?

I'm not sure I got what you mean by "having subarchitecture options",
could you explain?

Cheers,

-- 
Sam
