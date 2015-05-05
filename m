From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 22:55:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/autoconf-archive: fix ax_tls
 syntax error
In-Reply-To: <1430690664-32637-1-git-send-email-romain.naour@openwide.fr>
References: <1430690664-32637-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150505225549.5ad59086@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon,  4 May 2015 00:04:24 +0200, Romain Naour wrote:
> The ax_tls.m4 serial 11 procude a syntax error
> in configure scripts.
> 
> Fixes:
> http://autobuild.buildroot.net/results/619/619339810617212a667fe72278ec727ee992ffbf/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: remove the [] on the third part of AS_IF (Yann E. MORIN)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
