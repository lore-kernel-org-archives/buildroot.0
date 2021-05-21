From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 21 May 2021 23:28:56 +0200
Subject: [Buildroot] [PATCH 0/9] Fix binutils bug 21464 and remove it
In-Reply-To: <20210521212637.GX3208066@scaer>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
 <8db63dbe-1abb-3fbf-59c6-6cb14fde577c@mind.be>
 <62032574-bad4-5d93-fc72-4d3b455fe899@benettiengineering.com>
 <20210521212637.GX3208066@scaer>
Message-ID: <bdaf16e5-e709-29c9-e944-d9691f872aa9@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5/21/21 11:26 PM, Yann E. MORIN wrote:
> Giulio, Arnout, All,
> 
> On 2021-05-21 16:21 +0200, Giulio Benetti spake thusly:
>> On 5/21/21 10:46 AM, Arnout Vandecappelle wrote:
>>> On 03/05/2021 13:13, Giulio Benetti wrote:
>>>>    toolchain: remove binutils bug 21464
>>>>    package/libgeos: remove binutils bug 21464 dependency
>>>>    package/postgis: remove libgeos binutils bug 21464 inheritance
>>>>    package/protobuf: remove binutils bug 21464 dependency
>>>   These four should be squashed into a single patch.
>> I've just sent a v2 for this:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20210521140942.3032331-1-giulio.benetti at benettiengineering.com/
> 
> As a consequence, I've marked the original 4 as supersded in Patchwork,
> which only leaves the remaining two:
> 
>      package/libgeos: fix build failure due to missing -mcmodel=large
>      package/protobuf: fix build failure due to missing -mcmodel=large

Oh yes, I've forgotten, thank you :-)

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
