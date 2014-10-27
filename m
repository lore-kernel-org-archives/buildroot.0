From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 17:41:39 +0100
Subject: [Buildroot] [PATCH] trinity: Bump version to fix a PowerPC
 build failure
In-Reply-To: <1414426287-18973-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1414426287-18973-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141027174139.05994178@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 27 Oct 2014 16:11:27 +0000, Vicente Olivert Riera wrote:
> Some PowerPC toolchains have old Linux headers which don't define the
> KVM_CREATE_SPAPR_TCE and KVM_ALLOCATE_RMA macros. To workaround this
> problem we enclose the lines which use these macros into ifdef blocks.
> 
> This fix has been merged upstream so we bump the version to fix the
> problem in Buildroot as well.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/3a4/3a4e7e6077cd4bbbcb8fe398e0938ad228306d2d/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/trinity/trinity.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
