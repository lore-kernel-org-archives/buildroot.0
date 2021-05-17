From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 17 May 2021 21:53:06 +0000
Subject: [Buildroot] [PATCH v3 2/4] lmbench: memsize: increase delay for
 slow FPGAs
In-Reply-To: <20210517200906.GE2506@scaer>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-4-vgupta@synopsys.com> <20210517200906.GE2506@scaer>
Message-ID: <0c486431-d2fb-d7e7-0c35-9d419b31b48a@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 5/17/21 1:09 PM, Yann E. MORIN wrote:
>
>> OK
>> ---
> This triple-dash line is the usual git marker to end the actual commit
> log, so everything below was dropped when applying the patch with git-am.
> I've fixed that, and applied to master, thanks.

Yep I'm aware of that and sorry - there's no easy way to "underline" 
stuff in a patch :-)

> However, I wonder how relevant lmbench is nowadays. Indeed, there has
> been zero activity on lmbench source code since June 2009, almost 12
> years ago now...

Depends on who you ask. I think it is still relevant for embedded 
platforms.? Especially when doing new CPU and/or ISA bringup - former we 
tend to do regularly at Synopsys it gives you a great "snapshot" of 
performance of 2 systems: old and new. And this is true starting from 
fork/shell latency to memory latency and bandwidth tests which are still 
pretty smart for something written so long ago.

Thx for merging the patches.

-Vineet
