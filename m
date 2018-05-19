From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 21:50:41 +0200
Subject: [Buildroot] [PATCH for-next] package/terminology: bump version
 to 1.2.1
In-Reply-To: <20180519153732.17320-1-romain.naour@gmail.com>
References: <20180519153732.17320-1-romain.naour@gmail.com>
Message-ID: <20180519215041.2975210f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 May 2018 17:37:32 +0200, Romain Naour wrote:
> Switch to meson build system introduced with 1.2.0 release.
> Handle NLS option with BR2_SYSTEM_ENABLE_NLS.
> Add license file hash.
> 
> See release note:
> (1.2.0) https://sourceforge.net/p/enlightenment/mailman/message/36294478/
> (1.2.1) https://sourceforge.net/p/enlightenment/mailman/message/36317484/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/terminology/terminology.hash |  5 +++--
>  package/terminology/terminology.mk   | 32 ++++++++++++++++++++++++++++----
>  2 files changed, 31 insertions(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
