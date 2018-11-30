From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Nov 2018 09:00:31 +0100
Subject: [Buildroot] [PATCH v1] valgrind: disable for mips32r6/mips32elr6
In-Reply-To: <20181129223732.25159-1-ps.report@gmx.net>
References: <20181129223732.25159-1-ps.report@gmx.net>
Message-ID: <20181130090031.732df645@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Nov 2018 23:37:32 +0100, Peter Seiderer wrote:
> Fixes [1]:
> 
>   /tmp/ccD2Tule.s: Assembler messages:
>   /tmp/ccD2Tule.s:682: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movn $2,$4,$7'
>   /tmp/ccD2Tule.s:2767: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movn $2,$4,$7'
> 
> [1] http://autobuild.buildroot.net/results/f0253d1ed11021d3e5914a5161360de3ef3d1641
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/valgrind/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
