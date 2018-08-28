From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:39:12 +0200
Subject: [Buildroot] [PATCH] libsoup: security bump to version 2.62.3
In-Reply-To: <b3371f0ae3c4c91fc17182950ecaf97879d7da34.1535448446.git.baruch@tkos.co.il>
References: <b3371f0ae3c4c91fc17182950ecaf97879d7da34.1535448446.git.baruch@tkos.co.il>
Message-ID: <20180828223912.19e8e224@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 12:27:26 +0300, Baruch Siach wrote:
> Fixes CVE-2018-12910: The get_cookies function in soup-cookie-jar.c in
> libsoup 2.63.2 allows attackers to have unspecified impact via an empty
> hostname.
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libsoup/libsoup.hash | 4 ++--
>  package/libsoup/libsoup.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks. The security fix has been added to master, so
we will have to pay attention when merging back next into master: the
security patch will be in package/libsoup/, but it should be removed,
because it won't apply on the new version of libsoup.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
