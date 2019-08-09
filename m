From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:40:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/mpd: upnp needs curl
In-Reply-To: <20190809081104.19686-1-fontaine.fabrice@gmail.com>
References: <20190809081104.19686-1-fontaine.fabrice@gmail.com>
Message-ID: <20190809224059.2a828513@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  9 Aug 2019 10:11:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Since switch to meson-package, upnp requires curl:
> https://github.com/MusicPlayerDaemon/MPD/commit/94592c14062d5afc9482d11baa401648082022c0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1276d4be7270be6feada5d5c8b9e31db563ccc97
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mpd/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
