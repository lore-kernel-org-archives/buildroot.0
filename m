From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 23:40:42 +0200
Subject: [Buildroot] [PATCH/RFC v3 01/50] package/ffmpeg: bump version
 to 2.7.1
In-Reply-To: <1437332755-9764-2-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
 <1437332755-9764-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150720234042.0506112c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Jul 2015 21:05:06 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ix-dxva-playback-of-streams-that-don-t-st.patch |    6 +-
>  package/ffmpeg/0014-fix-ff-thread-get-format.patch |  131 --------------------
>  .../ffmpeg/0015-hevc-avoid-unnecessary-calls.patch |   72 -----------
>  package/ffmpeg/ffmpeg.hash                         |    2 +-
>  package/ffmpeg/ffmpeg.mk                           |    2 +-
>  5 files changed, 5 insertions(+), 208 deletions(-)
>  delete mode 100644 package/ffmpeg/0014-fix-ff-thread-get-format.patch
>  delete mode 100644 package/ffmpeg/0015-hevc-avoid-unnecessary-calls.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
