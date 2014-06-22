From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:33:17 +0200
Subject: [Buildroot] [PATCH v2] wpa_supplicant: disable for avr32
In-Reply-To: <98b8462a6b76b2b2e5ece86affe4f75a607abeff.1402816764.git.baruch@tkos.co.il>
References: <98b8462a6b76b2b2e5ece86affe4f75a607abeff.1402816764.git.baruch@tkos.co.il>
Message-ID: <20140622223317.06b5abe3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 15 Jun 2014 10:19:24 +0300, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/209/20908f479b33c1e2952622f5e8ad6b60d58af693/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>    Move 'depend on' above 'help' (Thomas Petazzoni)
> ---
>  package/wpa_supplicant/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
