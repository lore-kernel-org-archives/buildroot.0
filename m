From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:45:22 +0100
Subject: [Buildroot] [PATCH/next 06/31] package/kodi: bump version to
 16.0-Jarvis
In-Reply-To: <1456006176-21308-7-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160229234522.7aa51af3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:11 +0100, Bernd Kuhls wrote:
> Add two new hard dependencies:
> 
> - libdcadec
> https://github.com/xbmc/xbmc/commit/0997117a659a09e7b1c5bcb110f3526ea16698be
> 
> - libcrossguid
> https://github.com/xbmc/xbmc/commit/6f8171f53992fc2eaabf71f6fa47ebed1da0d43d
> 
> Kodi moved to C++11 so we need gcc >= 4.7:
> https://github.com/xbmc/xbmc/pull/6412
> 
> wavpack support was removed in favour of ffmpeg:
> https://github.com/xbmc/xbmc/commit/7916902c9e6f7a523265594f3ad7f921f93f1cd4
> 
> Enabled giflib support by default.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy                                    |  7 +++++++
>  ...g.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch | 21 ++++++++++++---------
>  package/kodi/Config.in                              | 20 ++++++++------------
>  package/kodi/kodi.hash                              |  2 +-
>  package/kodi/kodi.mk                                | 13 +++----------
>  5 files changed, 31 insertions(+), 32 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
