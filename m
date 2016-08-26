From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 21:46:51 +0200
Subject: [Buildroot] [PATCH/next v5 4/6] package/ffmpeg: add optional
 support for opencv
In-Reply-To: <1471273421-12076-4-git-send-email-bernd.kuhls@t-online.de>
References: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
 <1471273421-12076-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160826214651.136a994b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Aug 2016 17:03:39 +0200, Bernd Kuhls wrote:
> ffmpeg only needs the imgproc module of opencv:
> https://github.com/FFmpeg/FFmpeg/commit/15708f13477aaf2effdc0d7fc727507bc468335a
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to next. However: what about opencv3 support?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
