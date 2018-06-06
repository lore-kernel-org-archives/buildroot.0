From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 22:21:41 +0200
Subject: [Buildroot] [PATCH 1/1] dnsmasq: NLS/i18n does not mandate
 libidn anymore
In-Reply-To: <20180501131008.30114-1-fontaine.fabrice@gmail.com>
References: <20180501131008.30114-1-fontaine.fabrice@gmail.com>
Message-ID: <20180606222141.43d49f24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 15:10:08 +0200, Fabrice Fontaine wrote:
> Since May 2017, automatic inclusion of IDN has been removed when
> building internationalisation support:
> http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=43cdf1c3d074e75389392d495690923ef37d3248
> 
> This patch is a first step before the addition of libidn2 package
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dnsmasq/dnsmasq.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
