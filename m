From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 14:55:35 +0200
Subject: [Buildroot] [PATCH] sudo: bump to version 1.8.23
In-Reply-To: <8f724478de642846964735c3f6341dacbc9a3eb0.1525776241.git.baruch@tkos.co.il>
References: <8f724478de642846964735c3f6341dacbc9a3eb0.1525776241.git.baruch@tkos.co.il>
Message-ID: <20180508145535.76674d70@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 May 2018 13:44:01 +0300, Baruch Siach wrote:
> Use += for the SUDO_CONF_ENV conditional assignment to avoid override of
> SUDO_CONF_ENV assignments that might be added in the future.
> 
> Add license file hash.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/sudo/sudo.hash | 4 +++-
>  package/sudo/sudo.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
