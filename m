From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:21:58 +0200
Subject: [Buildroot] [PATCH/next 2/3] package/vlc: use pkgconf to find
 live555 libraries
In-Reply-To: <20180818182258.2936-2-bernd.kuhls@t-online.de>
References: <20180818182258.2936-1-bernd.kuhls@t-online.de>
 <20180818182258.2936-2-bernd.kuhls@t-online.de>
Message-ID: <20180820232158.4e4507bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 20:22:57 +0200, Bernd Kuhls wrote:
> Some live555 libraries were missing in LIVE555_LIBS.
> Instead of maintaining the list of live555 library files we use pkgconf
> instead.
> 
> Fixes
> http://autobuild.buildroot.net/results/744/7445bdc2fdcb28aa7f58c0249653329414e447df/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/vlc.mk | 8 --------
>  1 file changed, 8 deletions(-)

Applied to next, thanks. pkg-config is good.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
