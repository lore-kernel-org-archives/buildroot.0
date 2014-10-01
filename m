From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Wed, 01 Oct 2014 21:41:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-30
In-Reply-To: <20141001213513.1dedb82c@free-electrons.com>
References: <20141001063012.7DD7A100CC7@stock.ovh.net>	<542C5684.8050201@posteo.de>
 <20141001213513.1dedb82c@free-electrons.com>
Message-ID: <542C58DC.2080704@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 10/01/2014 09:35 PM, Thomas Petazzoni wrote:
> Dear J?rg Krause,
>
> On Wed, 01 Oct 2014 21:31:16 +0200, J?rg Krause wrote:
>> On 10/01/2014 08:30 AM, Thomas Petazzoni wrote:
>>> Build statistics for 2014-09-30
>>> ===============================
>>>
>>>            sh4 |                 upmpdcli-0.8.1 | NOK | http://autobuild.buildroot.net/results/e5be8fe46a30f0b417fe5fc19a27c480d885791e/
>> missing <cstdio>.
>>
>>>            sh4 |                 upmpdcli-0.8.1 | NOK | http://autobuild.buildroot.net/results/a3453afddff4fc03681f7fbdff3ccab9706eb189/
>> same.
>>
>> I will inform the developer of upmpdcli and submit a patch soon.
> Great, thanks a lot!
>

Hi Thomas,

I have a question to the patch you added to upmpdcli some month ago. You 
added among other things #define _GNU_SOURCE to upmpd/upmpdutils.cxx. 
Can you remember why?

The developer of upmpdcli asked me...he wants to submit the patch upstream.

Best regards
J?rg Krause
