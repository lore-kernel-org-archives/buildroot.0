From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Nov 2016 16:21:21 +0100
Subject: [Buildroot] [PATCH next 4/6] moarvm: select libffi when
 building for MIPS
In-Reply-To: <179a55e6-44e2-f242-b803-03517419df25@imgtec.com>
References: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
 <20161123143914.3969-4-Vincent.Riera@imgtec.com>
 <20161123215657.5ac2436d@free-electrons.com>
 <179a55e6-44e2-f242-b803-03517419df25@imgtec.com>
Message-ID: <20161124162121.7e15799e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your feedback.

On Thu, 24 Nov 2016 14:58:00 +0000, Vicente Olivert Riera wrote:

> MoarVM depends on libatomic_ops, and libatomic_ops doesn't have MIPS
> support in Buildroot so far. This patch series adds MIPS support to it,
> so, from that moment, MoarVM will be able to be built for MIPS.

If moarvm depends on libatomic_ops, then why the patch enabling MIPS
support in libatomic_ops is PATCH 5/6, i.e. *after* the patch enabling
moarvm? Won't things break if I apply only patches 1 to 4, but not
patches 5 and 6 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
