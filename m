From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 23:29:26 +0200
Subject: [Buildroot] [PATCH 03/13 v7] core/pkg-generic: add variable to
 store the package rawname-version
In-Reply-To: <1c8cdc36192a758ef66443c7c1175785c3d37f0b.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <1c8cdc36192a758ef66443c7c1175785c3d37f0b.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <20160511232926.2c57c36b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 18:14:28 +0200, Yann E. MORIN wrote:
> Introduce a new per-package variable to store the 'rawname-version'
> tuple, instead of computing it every time we need it.
> 
> Currently, it's only a single location, but follow-up patches will
> introduce more use of it.
> 
> Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v5 -> v6:
>   - rename variable  (Thomas)
> ---
>  package/pkg-generic.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
