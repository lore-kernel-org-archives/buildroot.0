From: jean.sorgemoel at laposte.net <jean.sorgemoel@laposte.net>
Date: Sat, 01 Mar 2014 21:59:51 +0100
Subject: [Buildroot] [PATCH 1/1] iso9660: Added support for overlay
	directories
In-Reply-To: <530F805E.2090906@laposte.net>
References: <1391549148-31993-1-git-send-email-martin@barkynet.com>
 <5301B4E9.60902@mind.be> <5303A40A.1090704@barkynet.com>
 <530F805E.2090906@laposte.net>
Message-ID: <53124A47.1000503@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>
>> On 17/02/14 07:06, Arnout Vandecappelle wrote:
>>> On 04/02/14 22:25, Martin Bark wrote:
>>>> This patch adds a variable BR2_TARGET_ROOTFS_ISO9660_OVERLAY that
>>>> is similar to BR2_ROOTFS_OVERLAY except the files are placed in the
>>>> iso9660 file system.
>>>>
>>>> Signed-off-by: Martin Bark <martin@barkynet.com>
>>>
>>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>>
>>>   I haven't tried it but it looks obviously-correct.
>>>
>>>   Jean Sergemoel has a patch in the queue that does a similar thing (in
>>> addition to a few more changes). Jean, could you rebase your patches on
>>> top of this one? And, if possible, also test if this one works for you.
>>> If yes, add your Tested-by to this patch.
>>
>> Arnout,
>>
>> Thanks for the review.  Yes by some strange coincidence both Jean and 
>> myself sent patches for the iso9660 file system on the same day.  I 
>> agree it would be best to rebase Jeans patches.
>>
>>
>> Jean,
>>
>> Let me know if you want any assistance on producing an updated patch 
>> set.
>>
>> Thanks
>>
>
> Hi All,
>
> Ok, I will include that in my patch.
>
> Regards,
> Jean

Hi All,

I will send new patch to include your remark.
I use my real name (Jerome Sagnole) :)

Arnout, for your remark on default (option 
BR2_TARGET_ROOTFS_ISO9660_ROCK_RIDGE)
I keep this default for compatibility because this option is activate in 
old code. If you want I can suppress that.

Regards,
Jerome
