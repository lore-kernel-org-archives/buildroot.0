From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Aug 2018 12:36:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: needs speexdsp for
 optional speex support
In-Reply-To: <20180811084855.16065-1-bernd.kuhls@t-online.de>
References: <20180811084855.16065-1-bernd.kuhls@t-online.de>
Message-ID: <20180811123641.5f67eff4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Aug 2018 10:48:55 +0200, Bernd Kuhls wrote:
> Fixes configure warning:
> 
> checking for SPEEX... yes
> checking for SPEEXDSP... no
> configure: WARNING: Package speexdsp was not found in the pkg-config search path.
> Perhaps you should add the directory containing `speexdsp.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'speexdsp', required by 'world', not found.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/vlc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
