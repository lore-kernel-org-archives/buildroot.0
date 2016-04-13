From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:32:31 +0200
Subject: [Buildroot] [PATCH] package/racehound: bump and fix dependencies
In-Reply-To: <1460579077-1219-1-git-send-email-yann.morin.1998@free.fr>
References: <1460579077-1219-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160413223231.781d281f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 22:24:37 +0200, Yann E. MORIN wrote:
> As pointed out by Arnout, racehound does not require kernel headers
> 3.14-or-later. So, drop this depenency.
> 
> It stills require a kernel >= 3.14 to build and run, but we really hae

hae -> have

> no way to express that dependency as Kconfig options.
> 
> Besides, racehound oes not build with kernel 4.5 because the struct

oes -> does

> modules has been updated. Bump racehound to fix that build failure.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/racehound/Config.in    | 6 ++----
>  package/racehound/racehound.mk | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)

Applied to master after fixing the typos, thanks.

Also, I see that racehound is fetched from github and does not have a
hash file. This definitely calls for a follow-up patch :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
