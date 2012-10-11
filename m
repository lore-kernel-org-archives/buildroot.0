From: Alexander Khryukin <alexander@mezon.ru>
Date: Thu, 11 Oct 2012 14:04:22 +0400
Subject: [Buildroot] rpm5
In-Reply-To: <CABtOAfx507KKScdea=Ptz-BzhYCh8tBQjL4S5cphs_MWoBxq4g@mail.gmail.com>
References: <1349695691.6518.2.camel@localhost> <50748D38.6000101@mind.be>
 <CABtOAfzoOqrjf83+caK4moJc26RsKEfvej2rOBS0ma2vw8-fpQ@mail.gmail.com>
 <CABtOAfx507KKScdea=Ptz-BzhYCh8tBQjL4S5cphs_MWoBxq4g@mail.gmail.com>
Message-ID: <CABtOAfwBcWbZ+xDF72OVSxM=99A9WcihQ-BcoBoMUBiJJQk27A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/10 Alexander Khryukin <alexander@mezon.ru>

>
>
> 2012/10/10 Alexander Khryukin <alexander@mezon.ru>
>
>>
>>
>> 2012/10/10 Arnout Vandecappelle <arnout@mind.be>
>>
>>> On 08/10/12 13:28, Alexander Khryukin wrote:
>>>
>>>> Full log
>>>> http://pastie.org/4932495
>>>>
>>>
>>>  It would be more relevant to post
>>> /home/fdkit/buildroot/output/**build/rpm-5.2.0/config.log
>>>
>>>  Also please post the file 'defconfig' which is generated when you do
>>> 'make savedefconfig'.  This will allow us to try to reproduce.
>>>
>>>  Also can you mention which BR version you're using?
>>>
>>>  However, before doing any of that, do a 'make clean' and recompile
>>> to see if that fixes your problem.
>>>
>>>  (It works for me, BTW).
>>>
>>>  Regards,
>>>  Arnout
>>> --
>>> Arnout Vandecappelle                               arnout at mind be
>>> Senior Embedded Software Architect                 +32-16-286540
>>> Essensium/Mind                                     http://www.mind.be
>>> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
>>> Leuven
>>> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
>>> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>>>
>>
>> Hi!
>> Thanks for the response
>>
>>
>> defconfig http://pastie.org/5029882
>>
>> config.log
>>
>> http://pastebin.com/L5CLKg06
>>
>>
>> Every time it fails at
>>
>> checking whether to build with BeeCrypt library... no
>> configure: error: mandatory BeeCrypt library not found
>> when it installed
>>
>
>
> Seems problem in
>
>  undefined reference to `GOMP_parallel_end'  on 10296,1 string
>
>

Bump
Problem still exist
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121011/2ce2accb/attachment-0001.html>
