From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:04:23 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/mpv: bump version to 0.33.0
In-Reply-To: <20210112065224.4275-1-bernd.kuhls@t-online.de>
References: <20210112065224.4275-1-bernd.kuhls@t-online.de>
Message-ID: <20210116220423.6e530bca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Jan 2021 07:52:24 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> rsound support was removed:
> https://github.com/mpv-player/mpv/commit/4583bd8cc7bf538bce424983d49729c934d13a53
> 
> libass is now mandatory:
> https://github.com/mpv-player/mpv/commit/0b9ed9c2744ada1eefc1f254c5f3ade6c626ed72
> Propagate new dependencies to tovid.
> 
> libsmbclient support was removed:
> https://github.com/mpv-player/mpv/commit/3b8b7cb9d481828953f105f92bacc07a3cb2f332
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: updated comments

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
