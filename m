From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 20 Apr 2016 10:47:47 +0200
Subject: [Buildroot] [PATCH] [RFC] U-Boot: don't check hashes for U-Boot
 external patches
In-Reply-To: <57156B4C.9090203@mind.be>
References: <1460644321-13849-1-git-send-email-julien.boibessot@free.fr>
 <57100509.8040804@mind.be> <57100ABB.8090206@mind.be>
 <5714B6C2.6020204@free.fr> <57156B4C.9090203@mind.be>
Message-ID: <57174233.9040302@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/2016 01:18, Arnout Vandecappelle wrote:
> On 04/18/16 12:28, Julien Boibessot wrote:
>> Hello,
>>
>> Arnout,
>>
>> thanks for the comments.
>>
>> On 14/04/2016 23:25, Arnout Vandecappelle wrote:
> [snip]
>>>
>>>   Oh, and something similar should be done for LINUX_PATCH as well.
>>
>> LINUX_PATCH is already working well with external patches that have to
>> be downloaded.
>
>  Of course, because we don't have a linux.hash and probably never will
> have one.

ah ok, got it now ! :-)
So why can't we just get rid of uboot.hash too ?

Regards,
Julien
