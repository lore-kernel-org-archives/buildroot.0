From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:15:49 +0100
Subject: [Buildroot] Newbie: linux kernel config
In-Reply-To: <2a448ad0e7234e3e9ffe7eda61b48b92@exch13-mail05.win.slac.stanford.edu>
References: <2a448ad0e7234e3e9ffe7eda61b48b92@exch13-mail05.win.slac.stanford.edu>
Message-ID: <20150125151549.798facc2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Your question is off-topic: it's not a Buildroot question, but a kernel
question. I'll nonetheless try to give a hint, but please use the
appropriate mailing list for questions.

On Wed, 21 Jan 2015 17:26:00 +0000, Williams Jr., Ernest L. wrote:

> Symbol: X86_BIGSMP [=n]
> Type : boolean
> Prompt: Support for big SMP systems with more than 8 CPUs
> Location:
> -> Processor type and features
> Defined at arch/x86/Kconfig:330
> Depends on: X86_32 [=n] && SMP [=y]

See this last line? This option only exists on x86 32 bits systems, and
most likely you are building a x86 64 bits system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
