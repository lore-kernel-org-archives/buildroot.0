From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 25 Feb 2009 11:07:13 +0100
Subject: [Buildroot] Cris strace-4.5.18 patch
In-Reply-To: <49A516ED.9050603@cetrtapot.si>
References: <49A50682.2050903@cetrtapot.si>	<20090225100001.3e6bffd7@hcegtvedt>
	<20090225100317.4e26431f@hcegtvedt> <49A516ED.9050603@cetrtapot.si>
Message-ID: <49A51851.7080904@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hinko Kocevar wrote:
> Hans-Christian Egtvedt wrote:
>> On Wed, 25 Feb 2009 10:00:01 +0100
>> Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> wrote:
>>
>>> On Wed, 25 Feb 2009 09:51:14 +0100
>>> Hinko Kocevar <hinko.kocevar@cetrtapot.si> wrote:
>>>
>>>> Hi,
>>>>
>>>> I have this patch laying around for some time. I'm using it 
>>>> for our cris embedded target and haven't had any issues with it.
>>>>
>>>> Please apply.
>>>>
>>> It does not apply at CVS HEAD, so I would recommend that you checkout
>>> the source code from CVS and rebase against it.
>>>
>> Woha, look at me, I'm on the strace-devel list as well and though this
>> was mailed there. You should email the patch there, so that it will be
>> included in mainline.
>>
> 
> I'll do that and re-base the patch against CVS tree.
> 

Good, then it will hopefully be included in the next release :)

>> For Buildroot you should make a patch changing what needs to be done in
>> SVN and adding your patch properly.
> 
> Right, I don't have SVN commit permissions, so I'll resend the patch here. Is that OK?
> 

Others can commit your patch to SVN. Remember that the patch to 
Buildroot list must be against the patches Buildroot uses and that 
specific version, while strace-devel wants a patch against current HEAD.

-- 
Best regards,
Hans-Christian Egtvedt
