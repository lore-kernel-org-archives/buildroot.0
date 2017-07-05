From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:33:09 +0200
Subject: [Buildroot] [PATCH] package/filemq: bump to the latest master
In-Reply-To: <20170705081957.10639-1-romain.naour@smile.fr>
References: <20170705081957.10639-1-romain.naour@smile.fr>
Message-ID: <20170705113309.017d0429@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 10:19:57 +0200, Romain Naour wrote:
> This bump include a patch that fixes a build issue with gcc >= 7.1.
> 
> Fixes:
> http://autobuild.buildroot.net/results/434/43452430edf44cbcef6ea3a5ab80ac0ff406208f
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/filemq/filemq.hash | 2 +-
>  package/filemq/filemq.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
