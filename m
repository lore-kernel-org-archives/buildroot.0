From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 12:55:56 +0100
Subject: [Buildroot] [PATCH v4] lmbench: fix build with libtirpc
In-Reply-To: <c76c5fb6b3cab78e103c6ed6e280da6b8ccdfdcb.1425636650.git.baruch@tkos.co.il>
References: <c76c5fb6b3cab78e103c6ed6e280da6b8ccdfdcb.1425636650.git.baruch@tkos.co.il>
Message-ID: <20150306125556.5ef20507@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri,  6 Mar 2015 12:10:50 +0200, Baruch Siach wrote:
> When linking with an external libtirpc, -ltirpc must come after lmbench.a in
> the linker command line. Use LDLIBS for that.
> 
> Fixes:
> http://autobuild.buildroot.net/results/89e/89ee35561d3a49f38e9a747ed78a5846be4764c8/
> http://autobuild.buildroot.net/results/409/4097b1c2585db2de517a8741174c02177aabee00/
> 
> and more.
> 
> Also, remove LMBENCH_LDLIBS assignment. This variable was not used before.
> 
> Reviewed-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
