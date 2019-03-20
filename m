From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Wed, 20 Mar 2019 09:43:36 +0000
Subject: [Buildroot] [RFC PATCH] package/libcamera: Add libcamera package
In-Reply-To: <20190320092930.GI2702@scaer>
References: <20190319110326.15153-1-kieran.bingham@ideasonboard.com>
 <20190319125040.GA2702@scaer>
 <940dcdca-91e1-9460-35f7-782959a7ad02@ideasonboard.com>
 <100d21c9-da59-239c-29b2-e6d5bb38106d@mind.be>
 <824b7b41-dbdd-69f5-9c20-8965c95db69e@ideasonboard.com>
 <20190320092930.GI2702@scaer>
Message-ID: <9c78dac2-f925-c1e4-e0f7-ec624474abea@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 20/03/2019 09:29, Yann E. MORIN wrote:
> Kieran, All,
> 
> On 2019-03-20 09:25 +0000, Kieran Bingham spake thusly:
>> On 19/03/2019 23:18, Arnout Vandecappelle wrote:
>>>  AFAIU, we only specify licenses of stuff installed on target. Since
>>> /usr/share/doc gets removed in target-finalize, the doc license should not be
>>> relevant.
>> Ok, so should I just remove the CC licence?
> 
> Yes, drop it both from the list and the files-list.
> 
>> Are all of these relevant actually? I wonder if I should drop the
>> cc-by-sa-v4.0 if I'm dropping the docs licence above, and the DCO, as
>> that's only really about contributing to the project?
> 
> Yes, drop the CC license and the DCO.

Ack, will do :)

Thanks again for your time. Once I get the pending libcamera patches
reviewed and integrated I'll repost a v2 and we should be nearly there :D


Thank you for your help!


> Regards,
> Yann E. MORIN.
> 

-- 
Regards
--
Kieran
