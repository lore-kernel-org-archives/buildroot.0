From: Andreas Ehmanns <universeii@gmx.de>
Date: Thu, 17 Dec 2015 21:26:50 +0100
Subject: [Buildroot] [PATCH 1/1] Add config to nfsd to set number of
 threads
In-Reply-To: <20151217202555.GE3653@free.fr>
References: <1450381505-3796-1-git-send-email-universeII@gmx.de>
 <20151217200424.GC3653@free.fr> <567317AE.5060006@gmx.de>
 <20151217202555.GE3653@free.fr>
Message-ID: <56731A8A.2090909@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,
Am 17.12.2015 um 21:25 schrieb Yann E. MORIN:
> Andreas, All,
>
> On 2015-12-17 21:14 +0100, Andreas Ehmanns spake thusly:
>> Am 17.12.2015 um 21:04 schrieb Yann E. MORIN:
> [--SNIP--]
>>> Unrelated yto this change, I noticed that this script is completely
>>> consistent with how it stops services:
>>>    - sometimes, we killall, sometimes we kill-9
>>>    - the order in which we kill, echo and rm pid file is not consistent
>>>
>>> It would be nice if we stopped all the NFS services in a consistent way,
>>> like always use killall, then remove the pid file, and eventually echo
>>> the status. Would you like to send a follow-up patch that does that
>>> cleanup, please? ;-)
>> I can prepare a patch for that but I have no possibility to test the changes
>> since today was my last day in office for this year and I don't have a
>> target system here at home.
>>
>> What do you think?
> No problem at all! Just work on it when you can, it's absolutely not
> time-critical.
>
> Thanks, and happy end-of-year celebrations! ;-)
>
> Regards,
> Yann E. MORIN.
>
O.k. I will prepare it begin of January.

Regards,
Andreas
