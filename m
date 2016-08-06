From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 23:59:09 +0200
Subject: [Buildroot] [PATCH v2] openblas: P5600 and I6400 cores only
 available for Codescape toolchains
In-Reply-To: <20160719122741.6a0ac299@free-electrons.com>
References: <1468843539-29696-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160719122741.6a0ac299@free-electrons.com>
Message-ID: <20160806235909.2fc28fee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Jul 2016 12:27:41 +0200, Thomas Petazzoni wrote:

> If MSA-specific assembly code used in OpenBLAS, or are they just
> passing -mmsa to tell the compiler to emit MSA code if possible?

Answer: MSA-specific code is used, so it cannot build at all if -mmsa
is not passed.

So I've applied Vicente's patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
