From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 21:45:03 +0200
Subject: [Buildroot] [PATCH/next v5 1/6] package/ffmpeg: bump to version
 3.1.2
In-Reply-To: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
References: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160826214503.03a7684a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Aug 2016 17:03:36 +0200, Bernd Kuhls wrote:
> From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> - Remove non-existing configure options:
>   - --disable-mips32r2
>   - --disable-libvo-aacenc
>   - --enable-libdcadec
>     (https://github.com/FFmpeg/FFmpeg/commit/e259dc86a80398d56d1aabcf6203f80616a4d04d)
> 
> - Amend renamed configure options:
>   - --disable-mipsdspr1 has been renamed to --disable-mipsdsp
> 
> Remove all Kodi-related patches according to upstream repo:
> https://github.com/xbmc/FFmpeg/commits/release/3.1-xbmc
> 
> Kodi now uses an unpatched ffmpeg.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v5: bump to version 3.1.2
> v4: bump to version 3.1.1
> v3: bump to version 3.0.2
> v2: bump to version 3.0.1

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
