From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:38:49 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/freeswitch: Fix build with
 FFmpeg 4.0
In-Reply-To: <20180909141934.6814-1-bernd.kuhls@t-online.de>
References: <20180909141934.6814-1-bernd.kuhls@t-online.de>
Message-ID: <20180910173849.2c435f59@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 16:19:34 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v4: send again as standalone patch, rebased for buildroot master after
>     freeswitch bump to 1.8.1 (Thomas)
>     build-tested without bumping ffmpeg to 4.0.2,
>     AV_INPUT_BUFFER_PADDING_SIZE was added to ffmpeg 2.8 in 2015:
>     http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=29d147c94dd40a78ca3981f39365cc77dae9a0da
> v3: re-integrated in ffmpeg bump series
> v2: split patch from v1 series, added missing license hashes,
>     git-formatted patch 0002
>     patch 0001 can not be reformatted because Makefile.in is not part of
>     the git repository

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
