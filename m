From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 23:19:10 +0200
Subject: [Buildroot] [PATCH] clapack: disable for m68k coldfire
In-Reply-To: <20160731210541.GA15636@waldemar-brodkorb.de>
References: <20160731210541.GA15636@waldemar-brodkorb.de>
Message-ID: <20160801231910.229e9ddb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 23:05:41 +0200, Waldemar Brodkorb wrote:
> Either a assembler bug or a platform limitation.
> Fixes:
> http://autobuild.buildroot.net/results/d24a2e9b35c98a10585cd28b3306a09c49163296/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/clapack/Config.in |    2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
