From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Aug 2018 11:19:37 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/botan: fix altivec support
In-Reply-To: <20180826112959.22790-1-bernd.kuhls@t-online.de>
References: <20180826112959.22790-1-bernd.kuhls@t-online.de>
Message-ID: <20180827111937.44141568@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Aug 2018 13:29:59 +0200, Bernd Kuhls wrote:
> configure.py only supports --disable-altivec.
> 
> Fixes
> http://autobuild.buildroot.net/results/318/3187afa3eea77e5de0e0fe14717bfc080da08117/
> 
> Added license hash URL.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/botan/botan.hash | 2 +-
>  package/botan/botan.mk   | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
