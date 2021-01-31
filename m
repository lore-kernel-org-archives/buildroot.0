From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:58:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/mpd: disable documentation
In-Reply-To: <20210130112647.1835553-1-fontaine.fabrice@gmail.com>
References: <20210130112647.1835553-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131215828.13bd4e48@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Jan 2021 12:26:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable documentation which is enabled by default since version 0.22 and
> https://github.com/MusicPlayerDaemon/MPD/commit/2e73e605f78d2e6488e34465a8bfa9e4989a057f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mpd/mpd.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
