From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jun 2017 14:25:41 +0200
Subject: [Buildroot] [PATCH] libtirpc: Fix build error due to missing
 stdint.h inclusion
In-Reply-To: <0ED1FB7E7CA752468B2E7F31EDFC6CD6013BA8A2@de02wembxa.internal.synopsys.com>
References: <20170615180517.17185-1-dmitrii@synopsys.com>
 <20170615231920.5816dc03@windsurf.lan>
 <0ED1FB7E7CA752468B2E7F31EDFC6CD6013BA8A2@de02wembxa.internal.synopsys.com>
Message-ID: <20170616142541.51df47c6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Jun 2017 11:51:49 +0000, Dmitrii Kolesnichenko wrote:

> > Thanks for the contribution. However, could you be more specific
> > about which Buildroot configuration triggers this build failure?  
> 
> It occurs when I build rootfs for ARC glibc toolchain. When I build
> uClibc toolchain this failure doesn't occur.

That is weird. Why we aren't seeing this with our other glibc
toolchains? Is it because you're testing with the latest glibc master,
which exhibits this issue?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
