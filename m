From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:20:05 +0200
Subject: [Buildroot] [PATCH] lightning: requires share library support
In-Reply-To: <844c4c9551f38dfbf091150262c1a04d3de2e953.1439271534.git.baruch@tkos.co.il>
References: <844c4c9551f38dfbf091150262c1a04d3de2e953.1439271534.git.baruch@tkos.co.il>
Message-ID: <20150818112005.4a74a251@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 11 Aug 2015 08:38:54 +0300, Baruch Siach wrote:
> Uses -ldl unconditionally.
> 
> Fixes:
> http://autobuild.buildroot.net/results/55d/55d30db7212863d9f898bb929f0c75d529036bad/
> http://autobuild.buildroot.net/results/6c3/6c37a1cd353b7cac854cc85d29a8232233414c68/
> http://autobuild.buildroot.net/results/459/459ab12bc3eeb493f39efa2450bc829a351ee3a3/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/lightning/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
