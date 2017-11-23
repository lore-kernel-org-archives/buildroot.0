From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 21:10:56 +0100
Subject: [Buildroot] [PATCH] shairport-sync: security bump to version
 3.1.4
In-Reply-To: <20171123193641.6609-1-joerg.krause@embedded.rocks>
References: <20171123193641.6609-1-joerg.krause@embedded.rocks>
Message-ID: <20171123211056.02332ffa@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Nov 2017 20:36:41 +0100, J?rg Krause wrote:
> The bundled tinysvcmdns library is affected by CVE-2017-12087 [1]:
> 
> > An exploitable heap overflow vulnerability exists in the tinysvcmdns library
> > version 2016-07-18. A specially crafted packet can make the library overwrite
> > an arbitrary amount of data on the heap with attacker controlled values. An
> > attacker needs send a dns packet to trigger this vulnerability.  
> 
> shairport-sync has incorparated upstreams fixes in [2].
> 
> [1] https://bugs.launchpad.net/bugs/cve/2017-12087
> [2] https://github.com/mikebrady/shairport-sync/commit/1dbdf94811b8315705dbac5ba9199d417231c5d3
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/shairport-sync/shairport-sync.hash | 2 +-
>  package/shairport-sync/shairport-sync.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
