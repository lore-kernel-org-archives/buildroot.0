From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Mar 2018 22:47:04 +0100
Subject: [Buildroot] [PATCH for-master] package/efl: add missing licenses
In-Reply-To: <20180301205457.18279-1-romain.naour@gmail.com>
References: <20180301205457.18279-1-romain.naour@gmail.com>
Message-ID: <20180302224704.74db8151@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Mar 2018 21:54:57 +0100, Romain Naour wrote:
> ecore_con added with efl 1.17 is under MIT license (COPYING.NGINX-MIT)
> ector added with efl 1.15 is under FTL license (COPYING.FTL)
> 
> While at it, add license file hash.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/efl.hash | 8 ++++++++
>  package/efl/efl.mk   | 3 ++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
