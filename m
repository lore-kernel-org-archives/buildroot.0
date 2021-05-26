From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 26 May 2021 22:06:24 +0200
Subject: [Buildroot] [PATCH 0/3] Riscv32 gcc bug 93532 workaround
In-Reply-To: <cf8e196a-a9a6-74d3-76ad-dbe98a86b00a@mind.be>
References: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
 <cf8e196a-a9a6-74d3-76ad-dbe98a86b00a@mind.be>
Message-ID: <402ebd21-9ba4-18e9-c1c9-c839975c55d7@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 5/26/21 8:43 PM, Arnout Vandecappelle wrote:
>   Hi Giulio,
> 
> On 03/02/2020 17:59, Giulio Benetti wrote:
>> Following Microblaze experience on gcc ICE and hangs let's treat the same
>> way Riscv32 gcc bugs. So let's introduce gcc bug already reported and
>> work around failing packages using -O0 optimization flash since no other
>> workarounds worked(disable -g, trying -O1).
>>
>> Giulio Benetti (3):
>>    toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_93532
>>    package/bullet: fix build failure due to gcc bug 93532
>>    package/lmbench: fix build failure due to gcc bug 93532
> 
>   This series has languished on patchwork for a long time. Since then, we've
> updated our autobuilders to GCC 9 for RISCV32 so we no longer see the issue.
> 
>   Since RISCV is still relatively new, we can kind of assume people will use a
> recent toolchain as well.
> 
>   Therefore, I propose to drop this series rather than introducing complexity
> that benefits nobody.
> 
>   I've marked the series as Rejected in patchwork. Feel free to reopen if there's
> a reason to.

I totally agree, those bugs never showed up anymore since I've submitted 
those patches, so it's ok for me.

Thank you

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
