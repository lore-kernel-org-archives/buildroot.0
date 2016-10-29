From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:39:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 3.2
In-Reply-To: <20161029120802.25370-1-bernd.kuhls@t-online.de>
References: <20161029120802.25370-1-bernd.kuhls@t-online.de>
Message-ID: <20161029153938.0b8b7eea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 14:08:02 +0200, Bernd Kuhls wrote:
> Support for libfaac was removed upstream:
> https://github.com/xbmc/FFmpeg/commit/dc0f711459e0c682bf9f94ba38d26736e90cff45
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.hash | 2 +-
>  package/ffmpeg/ffmpeg.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
