From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:22:02 +0100
Subject: [Buildroot] [PATCH v1] valgrind: disable for mips64r6/mips64elr6
In-Reply-To: <20181108214932.460-1-ps.report@gmx.net>
References: <20181108214932.460-1-ps.report@gmx.net>
Message-ID: <20181109222202.428cfe2c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Nov 2018 22:49:32 +0100, Peter Seiderer wrote:
> Fixes [1]:
> 
>   /tmp/ccBAUqbI.s: Assembler messages:
>   /tmp/ccBAUqbI.s:622: Error: opcode not supported on this processor: mips64r6 (mips64r6) `movn $2,$4,$7'
>   /tmp/ccBAUqbI.s:2607: Error: opcode not supported on this processor: mips64r6 (mips64r6) `movn $2,$4,$7'
> 
> [1] http://autobuild.buildroot.net/results/dc52088222e9fbedcebffc1c39be6d2fecfffe5d
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/valgrind/Config.in | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
