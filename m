From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 22:23:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-visualisation-fishbmc:
 remove opengl dependency
In-Reply-To: <20200223173646.610648-1-bernd.kuhls@t-online.de>
References: <20200223173646.610648-1-bernd.kuhls@t-online.de>
Message-ID: <20200223222300.240707d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Feb 2020 18:36:46 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The addon can also be used with OpenGLES:
> https://github.com/xbmc/visualization.fishbmc/blob/Leia/CMakeLists.txt
> 
> Updated project URL forgotten in
> https://git.buildroot.net/buildroot/commit/?id=4726e93c63d51fe287c62628a9c71c04517d727c
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-visualisation-fishbmc/Config.in | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
