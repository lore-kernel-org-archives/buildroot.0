From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:00:32 +0100
Subject: [Buildroot] [PATCH] luvi: build for the right MIPS endianness
In-Reply-To: <1453133375-54831-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1453133375-54831-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160119220032.77a657c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 18 Jan 2016 16:09:35 +0000, Vicente Olivert Riera wrote:
> Otherwise it will cause build failures like this one:
> 
> [100%] Linking C executable luvi
> /home/buildroot/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/5.2.0/../../../../mipsel-buildroot-linux-gnu/bin/ld:
> jitted_tmp/src/lua/init.lua_luvi_generated.o: compiled for a big endian
> system and target is little endian
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/luvi/luvi.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
