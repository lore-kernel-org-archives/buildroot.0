From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:40:04 +0100
Subject: [Buildroot] [PATCH v3] lame: Disable debug symbols for Aarch64
 and MIPS
In-Reply-To: <1414663541-36385-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1414663541-36385-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141030224004.73ae68bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 30 Oct 2014 10:05:41 +0000, Vicente Olivert Riera wrote:
> Building lame with debug symbols needs the following macros to be
> defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
> So, if BR2_ENABLE_DEBUG is selected, then we have to force lame to be
> built without debug symbols for Aarch64 and MIPS because these
> architectures don't have those macros defined.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/721/721dff299b204b1d3ccc0846009eb17faa2d29eb/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
