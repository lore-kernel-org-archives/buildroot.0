From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Apr 2020 16:27:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: remove optional libtheora
 support
In-Reply-To: <20200405130759.8096-1-bernd.kuhls@t-online.de>
References: <20200405130759.8096-1-bernd.kuhls@t-online.de>
Message-ID: <20200405162709.399fef26@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Apr 2020 15:07:59 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Kodi plays these files through ffmpeg and does not link to libtheora
> anymore, see PR 9686.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy       | 6 ++++++
>  package/kodi/Config.in | 7 -------
>  package/kodi/kodi.mk   | 4 ----
>  3 files changed, 6 insertions(+), 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
