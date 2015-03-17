From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 15:43:54 +0100
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <55083CDE.7040007@zacarias.com.ar>
References: <20150315221722.3645eb35@free-electrons.com>
 <55082FFD.30305@zacarias.com.ar>
 <20150317144923.7e9b7fbb@free-electrons.com>
 <55083CDE.7040007@zacarias.com.ar>
Message-ID: <20150317154354.34f4d39d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Mar 2015 11:40:30 -0300, Gustavo Zacarias wrote:

> Back when i enabled it, the ADI toolchain gcc was pretty old compared to
> what we got with this.
> But newer gcc versions are broken, and although it may be something
> simple to fix, i'm not inclined to dig further.

Yeah, me neither.

> So it's probably best to just disable it, after all if someone wants to
> throw some time into fixing it, it's just a line away from re-enabling
> it and doing so.

Yes, I believe it's the sanest / easiest solution. Can you send a patch
to disable Blackfin in the internal toolchain backend ?

I'll remove the Buildroot generated Blackfin external toolchain from
the autobuilders.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
