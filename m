From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 11:40:30 -0300
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <20150317144923.7e9b7fbb@free-electrons.com>
References: <20150315221722.3645eb35@free-electrons.com>	<55082FFD.30305@zacarias.com.ar>
 <20150317144923.7e9b7fbb@free-electrons.com>
Message-ID: <55083CDE.7040007@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/17/2015 10:49 AM, Thomas Petazzoni wrote:

> Sure. So we need to decide whether it's worth support Blackfin in the
> internal toolchain backend at all.
> 
>> In the mean time i've sent a patch to switch blackfin's default to an
>> external (ADI) toolchain.
> 
> Great. But I've recently added a Buildroot-generated Blackfin external
> toolchain in the autobuilder toolchain configurations, so we need to
> decide if we want to support that or not.
> 
> From my point of view, since Blackfin already requires a very specific
> combination of compiler + binutils version, it's a bit of a dead end in
> terms of internal toolchain support, so we could just as well get rid
> of it entirely.

Back when i enabled it, the ADI toolchain gcc was pretty old compared to
what we got with this.
But newer gcc versions are broken, and although it may be something
simple to fix, i'm not inclined to dig further.
So it's probably best to just disable it, after all if someone wants to
throw some time into fixing it, it's just a line away from re-enabling
it and doing so.
Regards.
