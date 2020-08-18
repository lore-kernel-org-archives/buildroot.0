From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:49:59 +0200
Subject: [Buildroot] [PATCH 1/4] package/mpd: add libsidplay2 optional
 dependency
In-Reply-To: <20200814211940.1598502-1-fontaine.fabrice@gmail.com>
References: <20200814211940.1598502-1-fontaine.fabrice@gmail.com>
Message-ID: <20200818234959.4a847016@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Aug 2020 23:19:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libsidplay2 is an optional dependency since version 0.15.0 and
> https://github.com/MusicPlayerDaemon/MPD/commit/1136f6fb7a2a6a0a5bfba0dcf99410d1bbf04252
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mpd/Config.in | 6 ++++++
>  package/mpd/mpd.mk    | 7 +++++++
>  2 files changed, 13 insertions(+)

All four patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
