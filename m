From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Sep 2016 14:36:19 +0200
Subject: [Buildroot] [PATCH] supertuxkart: Constrain to x86 architecture
In-Reply-To: <20160901194429.11761-1-ezequiel@vanguardiasur.com.ar>
References: <20160901194429.11761-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160902143619.3d2d0774@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Sep 2016 16:44:29 -0300, Ezequiel Garcia wrote:
> Our build system has detected that angelscript can't be
> cross-compiled properly. This has been also reported to
> supertuxkart [1], and although the developers were open
> to take patches fixing STK embedded angelscript, it was
> pointed out that non-x86 architectures were not officially
> supported and of little interest [2].

If it's indeed that angelscript doesn't cross-compile properly, then,
it also needs to be limited to x86/x86_64 as the host compiler, no?

I.e: what happens if I'm using Buildroot on a PowerPC or ARM machine?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
