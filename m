From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:01:22 +0100
Subject: [Buildroot] [PATCH] valgrind: update
 0003-mips-replace-addi-with-addiu.patch
In-Reply-To: <1448981914-46671-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448981914-46671-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151217220122.47d71bfc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 1 Dec 2015 14:58:34 +0000, Vicente Olivert Riera wrote:
> This patch has been updated in the upstream bug report, so let's update
> it in Buildroot as well. It will fix the build issue for mips64r6:
> 
> m_dispatch/dispatch-mips64-linux.S:199: Error: opcode not supported on
> this processor: mips64r6 (mips64r6) `daddi $13,$13,8'
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/6ca/6ca3a31d1542fbbb44238e296565b40d6afcd5fa/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  .../0003-mips-replace-addi-with-addiu.patch        | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
