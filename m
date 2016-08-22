From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 16:45:40 +0200
Subject: [Buildroot] [PATCH] lirc-tools: enable for musl
In-Reply-To: <730163c3a1cee2a52aa6d5592c1a004c0aa5ef73.1471840773.git.baruch@tkos.co.il>
References: <730163c3a1cee2a52aa6d5592c1a004c0aa5ef73.1471840773.git.baruch@tkos.co.il>
Message-ID: <20160822164540.0c230a78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Aug 2016 07:39:33 +0300, Baruch Siach wrote:
> Upstream removed use of the GLOB_BRACE glob(3) GNU extension in release 0.9.4
> (commits 493857625 and 8bff82ed9c). See
> https://sourceforge.net/p/lirc/tickets/174/.
> 
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/lirc-tools/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
