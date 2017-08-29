From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 23:00:07 +0200
Subject: [Buildroot] [PATCH] dnsmasq: fix build without NLS
In-Reply-To: <ac762b8a4d2444aa2a914c80e419fab74b5a735a.1503942995.git.baruch@tkos.co.il>
References: <ac762b8a4d2444aa2a914c80e419fab74b5a735a.1503942995.git.baruch@tkos.co.il>
Message-ID: <20170829230008.1a7384ef@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Aug 2017 20:56:35 +0300, Baruch Siach wrote:
> dnsmasq i18n support requires NLS for the provided gettext utilities.
> Locale support, OTOH, is not required.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d45/d453aff1ce1f5e1d380bd7692a4a0565505027a3/
> http://autobuild.buildroot.net/results/fb7/fb7844a239472eb48c18778aa7d515552ccfb4b9/
> http://autobuild.buildroot.net/results/d85/d856ec3e6b28bd723176bb892a56dff5262a6b92/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/dnsmasq/dnsmasq.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
