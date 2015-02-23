From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Mon, 23 Feb 2015 20:18:40 +0100
Subject: [Buildroot] [PATCH v7] wine: New package
In-Reply-To: <20150222212607.GI4016@free.fr>
References: <54E63769.1050208@dawncrow.de> <20150222204207.GG4016@free.fr>
 <54EA42C0.9010608@dawncrow.de> <20150222212607.GI4016@free.fr>
Message-ID: <54EB7D10.1000708@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 22.02.2015 um 22:26 schrieb Yann E. MORIN:
> Andre, All,
> 
> On 2015-02-22 21:57 +0100, Andr? Hentschel spake thusly:
>> Am 22.02.2015 um 21:42 schrieb Yann E. MORIN:
>>> On 2015-02-19 20:20 +0100, Andr? Hentschel spake thusly:
>>>> Adds new package: wine
> 
> Another thing I noticed during the build of host-wine:
> 
>     configure: WARNING: prelink not found, base address of core dlls won't
>     be set correctly.
> 
> I am not sure if that will be a problem.

it doesn't care for host-wine, we just need the tools

> My system lacks prelink installed. Does yours have it?
>   - if not, I guess you get a working Wine, even without prelink, right?
>   - if you do, can you check that Wine still works fine without it?

well, a target-prelink would be great, but we should add it at a later point,
wine works without it, but might not in some special cases like copy protections
thinking twice i remember that there are issues with prelink and crosscompiling,
but there is https://www.yoctoproject.org/tools-resources/projects/cross-prelink
