From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Aug 2019 22:33:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: bump version to 0.29.1
In-Reply-To: <20190731061103.28534-1-bernd.kuhls@t-online.de>
References: <20190731061103.28534-1-bernd.kuhls@t-online.de>
Message-ID: <41d5de2e-a6f2-0fbf-7938-ce1b35719420@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bernd,

On 31/07/2019 08:11, Bernd Kuhls wrote:
> Added license hash, removed patches:
> 
> 0001: upstream PR was closed as 'merged'
> 0002: patch was backported and is now included

 Patch 1 and 2...

> 
> Renamed license file according to upstream change.
> 
> Support for sdl1 was removed upstream:
> https://github.com/mpv-player/mpv/commit/1dcf511376545de7624863b76d7f30dc3bb44ac9
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mpv/0003-rpi-fix-linking-errors.patch | 90 ------------------
>  package/mpv/0004-libva20.patch                | 93 -------------------

 But you're actually removing 3 and 4...

 I checked and removing 3 and 4 is in fact correct, so I fixed up the commit
message and applied to master, thanks.

 Regards,
 Arnout

>  package/mpv/mpv.hash                          |  3 +-
>  package/mpv/mpv.mk                            | 14 +--
>  4 files changed, 7 insertions(+), 193 deletions(-)
>  delete mode 100644 package/mpv/0003-rpi-fix-linking-errors.patch
>  delete mode 100644 package/mpv/0004-libva20.patch
