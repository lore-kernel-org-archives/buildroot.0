From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:20:13 +0200
Subject: [Buildroot] [PATCH 1/2] ffmpeg: add
 BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
In-Reply-To: <1464278060-49999-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464278060-49999-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160526212013.1a007aad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 16:54:19 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/ffmpeg/Config.in                | 8 ++++++--
>  package/gstreamer1/gst1-libav/Config.in | 2 +-
>  package/kodi/Config.in                  | 1 +
>  package/minidlna/Config.in              | 4 ++--
>  package/mpd/Config.in                   | 2 +-
>  package/mpv/Config.in                   | 4 ++--
>  package/opencv/Config.in                | 2 +-
>  package/opencv3/Config.in               | 2 +-
>  package/squeezelite/Config.in           | 2 +-
>  package/tovid/Config.in                 | 4 +++-
>  10 files changed, 19 insertions(+), 12 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
