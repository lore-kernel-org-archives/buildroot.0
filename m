From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Mar 2015 17:51:20 +0200
Subject: [Buildroot] [PATCH 1/3] package/ffmpeg: bump version to 2.6
In-Reply-To: <1426428048-25586-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426428048-25586-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150315155120.GD2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Mar 15, 2015 at 03:00:46PM +0100, Bernd Kuhls wrote:
> Dump two Kodi-specific patches according to
> https://github.com/xbmc/xbmc/pull/6636
> and update two new patches to improve hevc handling with Kodi Isengard.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/0002-asf-hacks.patch                |   42 -------
>  ...add-public-version-of-ff_read_frame_flush.patch |   54 --------
>  package/ffmpeg/0013-fix-ff-thread-get-format.patch |  131 ++++++++++++++++++++
>  .../ffmpeg/0014-hevc-avoid-unnecessary-calls.patch |   69 +++++++++++
>  package/ffmpeg/ffmpeg.mk                           |    2 +-
>  5 files changed, 201 insertions(+), 97 deletions(-)
>  delete mode 100644 package/ffmpeg/0002-asf-hacks.patch
>  delete mode 100644 package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
>  create mode 100644 package/ffmpeg/0013-fix-ff-thread-get-format.patch
>  create mode 100644 package/ffmpeg/0014-hevc-avoid-unnecessary-calls.patch

Please update the .hash file as well. Same goes for mesa3d.

barch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
