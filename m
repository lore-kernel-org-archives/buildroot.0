From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Apr 2021 09:25:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: bump to version
 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
In-Reply-To: <20210426194329.GL298901@scaer>
References: <20210426101021.2418145-1-romain.naour@gmail.com>
 <20210426101021.2418145-2-romain.naour@gmail.com>
 <e539cd7b-3775-024e-1f9f-67658e38a10b@mind.be>
 <20210426194329.GL298901@scaer>
Message-ID: <ad394a6c-1ec6-0659-51b6-c7704110c71a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/04/2021 21:43, Yann E. MORIN wrote:
> Arnout, Romain, All,
> 
> On 2021-04-26 21:36 +0200, Arnout Vandecappelle spake thusly:
>> On 26/04/2021 12:10, Romain Naour wrote:
>> [snip]
>>>  rename package/glibc/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/glibc.hash (70%)
>>>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0001-HACK-only-build-and-install-localedef.patch (100%)
>>>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
>>>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/localedef.hash (70%)
>>
>>  Now you're messing with these packages, maybe you can take the opportunity to
>> get rid of the versioned subdirectory. That's a leftover from when we had
>> version selection for glibc.
> 
> We stil have a version choice for glibc; it's just not exposed to the
> user: indeed we use different version for csky, riscv32, and the rest.
> 
> So, we still do not want to apply the "generic" patches to the csky
> fork, or to the riscv32 version...

 Ah, I missed the csky fork... The riscv32 one should be gone, so I thought that
was it.

 Regardless, for localedef, we don't have a version choice so we don't need the
subdirectory there.

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
