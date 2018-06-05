From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 22:15:19 +0200
Subject: [Buildroot] [PATCH 1/1] libstrophe: bump to version 0.9.2
In-Reply-To: <20180605194032.32151-1-fontaine.fabrice@gmail.com>
References: <20180605194032.32151-1-fontaine.fabrice@gmail.com>
Message-ID: <20180605221519.118b78ef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 21:40:32 +0200, Fabrice Fontaine wrote:
> - Remove first patch (already in version, see
>   https://github.com/strophe/libstrophe/pull/59)
> - Use --without-xml (fixed by
>   https://github.com/strophe/libstrophe/commit/3b55c20879aabad2f1b601b141d73c157972708d)
> - Add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../libstrophe/0001-Namespace-SHA-functions.patch  | 189 ---------------------
>  ...nfable.patch => 0001-make-autoreconfable.patch} |   0
>  package/libstrophe/libstrophe.hash                 |   4 +-
>  package/libstrophe/libstrophe.mk                   |   6 +-
>  4 files changed, 5 insertions(+), 194 deletions(-)
>  delete mode 100644 package/libstrophe/0001-Namespace-SHA-functions.patch
>  rename package/libstrophe/{0002-make-autoreconfable.patch => 0001-make-autoreconfable.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
