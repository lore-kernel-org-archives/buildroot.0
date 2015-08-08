From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 11:52:31 +0200
Subject: [Buildroot] [PATCH 1/7] package/rng-tools: needs
 argp-standalone with musl toolchains
In-Reply-To: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
References: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150808115231.23f66240@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  8 Aug 2015 00:47:13 +0200, Romain Naour wrote:
> Since argp-standalone is only available for uClibc-ng
> and musl toolchains, it's safe to link with it when
> the package is selected.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: fix argp-standalone dependency in rng-tools.mk
>     (Yann E.Morin)
> ---
>  package/rng-tools/Config.in    | 2 +-
>  package/rng-tools/rng-tools.mk | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

I've applied patches 1 to 6, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
