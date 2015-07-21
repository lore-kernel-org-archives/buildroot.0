From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 14:32:11 +0200
Subject: [Buildroot] [PATCH] netsnmp: fix static build
In-Reply-To: <d83c0f02c2d855f666b1bdd307723e339431d74c.1437468433.git.baruch@tkos.co.il>
References: <d83c0f02c2d855f666b1bdd307723e339431d74c.1437468433.git.baruch@tkos.co.il>
Message-ID: <20150721143211.7321e482@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 21 Jul 2015 11:47:13 +0300, Baruch Siach wrote:
> Exclude the ucd-snmp/dlmod MIB module when building statically.
> 
> Fixes:
> http://autobuild.buildroot.net/results/782/7829e74f83c3c4a1f45e049ec9f9d6b00e002c1c/
> http://autobuild.buildroot.net/results/5df/5df28482dfa3d7c54d1e4ae3e1d373bd8e9a2265/
> http://autobuild.buildroot.net/results/4b7/4b7f3c15a4f4c4f4457e78767f5526c044d6dc1d/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/netsnmp/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
