From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 15:37:05 +0200
Subject: [Buildroot] [PATCH 3/4] package/transmission: fix inotify
 configure option
In-Reply-To: <20180502060540.11628-3-bernd.kuhls@t-online.de>
References: <20180502060540.11628-1-bernd.kuhls@t-online.de>
 <20180502060540.11628-3-bernd.kuhls@t-online.de>
Message-ID: <20180520153705.0f864601@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 08:05:39 +0200, Bernd Kuhls wrote:
> The configure option is really called --with-inotify:
> https://github.com/transmission/transmission/blob/2.9x/configure.ac#L211
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/transmission/transmission.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
