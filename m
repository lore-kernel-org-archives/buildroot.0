From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 6 Mar 2017 21:32:08 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/physfs: new package
In-Reply-To: <3f6177f1-6dd4-119c-e6a1-fadc9faf483a@mind.be>
References: <20170301225611.11494-1-romain.naour@gmail.com>
 <4328635a-2687-59f6-a192-4af579aafb58@gmail.com>
 <20170305215137.1600833e@free-electrons.com>
 <755ee979-57de-4718-9fa0-5f7de1f05289@gmail.com>
 <20170305223749.3567d0af@free-electrons.com>
 <c341646a-fe08-f349-cb46-aed8d0430639@mind.be>
 <b370e822-a293-56ec-f151-69882e8b1786@gmail.com>
 <3f6177f1-6dd4-119c-e6a1-fadc9faf483a@mind.be>
Message-ID: <6a0758ea-ed02-21fe-1d4b-b45406b2ad54@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Thomas, All,

Le 06/03/2017 ? 00:31, Arnout Vandecappelle a ?crit :
> 
> 
> On 05-03-17 23:13, Romain Naour wrote:
>> Hi Arnout, all,
>>
>> Le 05/03/2017 ? 23:06, Arnout Vandecappelle a ?crit :
>>>
>>>
>>> On 05-03-17 22:37, Thomas Petazzoni wrote:
>>>> Hello,
>>>>
>>>> On Sun, 5 Mar 2017 22:14:02 +0100, Romain Naour wrote:
>>>>>> zlib license (physfs), LGPv2.1+ or CPL or special license (lzma)
>>>>>>
>>>>>>  ?  
>>>>>
>>>>> It seems some files are under public domain when the special license is used.
>>>>>
>>>>> SPECIAL EXCEPTION #3: Igor Pavlov, as the author of this code, expressly permits
>>>>> you to use code of the following files:
>>>>> BranchTypes.h, LzmaTypes.h, LzmaTest.c, LzmaStateTest.c, LzmaAlone.cpp,
>>>>> LzmaAlone.cs, LzmaAlone.java
>>>>> as public domain code.
>>>>>
>>>>> Maybe "special license" is enough ?
>>>>
>>>> My understanding of lzma.txt is that you really have the choice between
>>>> those different licensing options, so I believe encoding all of them in
>>>> <pkg>_LICENSE is probably better.
>>>>
>>>> Cc'ing Arnout and Yann to get their insight.
>>>
>>>  I was just about to reply :-)
>>>
>>>  First of all, I don't see any 'or later' language, so it's LGPL2.1 (the version
>>> mentioned in src/lzma/LGPL.txt).
>>
>> Try with "any later version"
> 
>  Still don't see it, except in LGPL.txt where they explain that the library
> should specify "any later version" if they want it to apply to a later version.

Sorry but I don't see how to make the difference between LGPL2.1 and LGPL2.1+.

I compared the license file of tree LGPL2.1+ packages (alsa-lib, cairo, sdl)
with src/lzma/LGPL.txt and the content is the same.

Ether alsa-lib, cairo, sdl license info are wrong or physfs is really LGPL2.1+ :)

Best regards,
Romain

> 
>  Regards,
>  Arnout
