From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 23:08:15 +0200
Subject: [Buildroot] [PATCH v2] assimp: fix m68k uclinux compile
In-Reply-To: <20160731180743.GA1487@waldemar-brodkorb.de>
References: <20160731180743.GA1487@waldemar-brodkorb.de>
Message-ID: <20160801230815.010fcf41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 20:07:43 +0200, Waldemar Brodkorb wrote:
> The GCC manual suggest when getting:
> relocation truncated to fit: R_68K_GOT16O foobar
> to use -mxgot.
> 
> https://gcc.gnu.org/onlinedocs/gcc/M680x0-Options.html
> 
> Fixes:
> http://autobuild.buildroot.net/results/63898c00929b4546279bda52148b218f847714ed/
> http://autobuild.buildroot.net/results/bb7a107d1ca6e8713e6ccffe6c61c43b777fb962/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/assimp/assimp.mk |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
