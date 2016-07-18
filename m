From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:44:15 +0200
Subject: [Buildroot] [PATCH 3/6] system: provide no default for custom
 skeleton path
In-Reply-To: <409ca6c1a9e541db283e4b2276f25b8322cad63f.1468744792.git.yann.morin.1998@free.fr>
References: <cover.1468744792.git.yann.morin.1998@free.fr>
 <409ca6c1a9e541db283e4b2276f25b8322cad63f.1468744792.git.yann.morin.1998@free.fr>
Message-ID: <20160718234415.78d97ae9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 10:44:25 +0200, Yann E. MORIN wrote:
> Being custom means that our default one is not suitable to start with.
> So there is no reson to offer it as the default path.
> 
> Add a check that it is not empty.
> 
> Add a separating empty line, for good measure, too.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v2 -> v3:
>   - add a check that it is not empty (Romain, Arnout)
> ---
>  package/skeleton/skeleton.mk | 6 ++++++
>  system/Config.in             | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)

Applied to master after fixing the typo noticed by Romain.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
