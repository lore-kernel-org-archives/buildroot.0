From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 29 Nov 2016 12:59:23 +0000
Subject: [Buildroot] [PATCH next 2/2] bash: bump version to 4.4
In-Reply-To: <20161129134029.25a9a847@free-electrons.com>
References: <20161129122404.59676-1-Vincent.Riera@imgtec.com>
 <20161129122404.59676-2-Vincent.Riera@imgtec.com>
 <20161129134029.25a9a847@free-electrons.com>
Message-ID: <4ee088c5-82e9-2f65-f9ef-92119bdd4e01@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 29/11/16 12:40, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 29 Nov 2016 12:24:04 +0000, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>> Notes to maintainer
>>  - This new version contains a small security fix. From
>>    http://tiswww.case.edu/php/chet/bash/NEWS:
>>
>>    "Shells running as root no longer inherit PS4 from the environment,
>>    closing a security hole involving PS4 expansion performing command
>>    substitution."
>>
>>    However, taking into account that bash is a critical package and the
>>    2016.11 release is very close I've marked this patch as "next".
> 
> "is a critical package" or "is *NOT* a critical package" ? If it's a
> critical package like you suggest, then perhaps we want it in master
> anyway ?

It *IS*, that's why I thought you may not want to have such a big
changes in master so close to the next release if you consider that
security fix is not very important.

Of course, if you think it's important then apply it to master.

I'm gonna test more reverse dependencies of readline by the way. I'll
let you know how it goes.

Vincent

> 
> Thanks,
> 
> Thomas
> 
