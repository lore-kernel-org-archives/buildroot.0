From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Aug 2016 08:06:07 +0200
Subject: [Buildroot] [PATCH/next v5 4/6] package/ffmpeg: add optional
 support for opencv
References: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
 <1471273421-12076-4-git-send-email-bernd.kuhls@t-online.de>
 <20160826214651.136a994b@free-electrons.com>
Message-ID: <f7n79dxcql.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 26 Aug 2016 21:46:51 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Mon, 15 Aug 2016 17:03:39 +0200, Bernd Kuhls wrote:
>> ffmpeg only needs the imgproc module of opencv:
>> https://github.com/FFmpeg/FFmpeg/commit/15708f13477aaf2effdc0d7fc727507bc468335a
>> 
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Applied to next. However: what about opencv3 support?

Hi Thomas,

according to ffmpeg/configure it only checks for opencv2:

http://git.videolan.org/?p=ffmpeg.git;a=blobdiff;f=configure;h=f28aa8ff66181e0025debd7480d3ad6e63e415ff;hp=f4b821ad313f1640b2698ef2ed5928ce24eca8f1;hb=15708f13477aaf2effdc0d7fc727507bc468335a;hpb=b70e9b4906a3d1a61c542da02793decba1dbabba

Regards, Bernd
