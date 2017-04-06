From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 10:33:00 +0200
Subject: [Buildroot] [PATCH v2] arp-scan: new package
In-Reply-To: <857569ae-aa99-8ae8-17c6-14d0f98afbc5@mind.be>
References: <20170405101410.27980-1-arnout@mind.be>
 <20170405183445.6cde0af8@free-electrons.com>
 <857569ae-aa99-8ae8-17c6-14d0f98afbc5@mind.be>
Message-ID: <20170406103300.04ef2b35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Apr 2017 10:26:58 +0200, Arnout Vandecappelle wrote:

>  Since it was caused by the bump of binutils, you should probably look at the
> binutils repo, not the elf2flt repo...

That was not my reasoning. My reasoning was that the new binutils
version does not have a bug, but generates a binary that is slightly
different than previous binutils version, and elf2flt does not handle
that correctly.

Of course, that's complete guess, but binutils is IMO a much better
maintained set of tools than elf2flt, so I would first and foremost
suspect a bug in elf2flt.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
