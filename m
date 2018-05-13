From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:27:13 +0200
Subject: [Buildroot] [PATCH] wget: security bump to version 1.19.5
In-Reply-To: <e453953371b3ff38359cb895d57bab0fd078f6c1.1525794182.git.baruch@tkos.co.il>
References: <e453953371b3ff38359cb895d57bab0fd078f6c1.1525794182.git.baruch@tkos.co.il>
Message-ID: <20180513222713.33bf79f9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 May 2018 18:43:02 +0300, Baruch Siach wrote:
> Fixes CVE-2018-0494: cookie injection vulnerability.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/wget/wget.hash | 4 ++--
>  package/wget/wget.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
