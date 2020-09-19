From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:33:36 +0200
Subject: [Buildroot] [PATCH 1/2] package/graphicsmagick: enable OpenMP
 when supported by toolchain
In-Reply-To: <20200918172135.85009-1-grzegorz@blach.pl>
References: <20200918172135.85009-1-grzegorz@blach.pl>
Message-ID: <20200919143336.05efe940@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Sep 2020 19:21:32 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/graphicsmagick/graphicsmagick.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
