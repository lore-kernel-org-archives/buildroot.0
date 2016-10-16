From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:41:12 +0200
Subject: [Buildroot] [PATCH 1/3] gcc: remove BR2_GCC_NEEDS_MPC
In-Reply-To: <20161016071133.23826-1-arnout@mind.be>
References: <20161016071133.23826-1-arnout@mind.be>
Message-ID: <20161016124112.03cb194a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Oct 2016 09:11:31 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The blind option BR2_GCC_NEEDS_MPC was used to distinguish gcc versions
> that rely on the mpc library and the ones that don't. But since a while
> already, all the versions we support do need the mpc library. So this
> symbol isn't needed anymore.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/gcc/Config.in.host | 8 --------
>  package/gcc/gcc.mk         | 7 ++-----
>  2 files changed, 2 insertions(+), 13 deletions(-)

All applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
