From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 21:59:46 +0100
Subject: [Buildroot] [PATCH] package/cryptsetup: use external libargon2
In-Reply-To: <20191204080547.20912-1-p.debruijn@unilogic.nl>
References: <20191204080547.20912-1-p.debruijn@unilogic.nl>
Message-ID: <20191208215946.4a6f8d33@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 09:05:47 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> don't use cryptsetup's intree libargon2
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/cryptsetup/Config.in     | 1 +
>  package/cryptsetup/cryptsetup.mk | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
