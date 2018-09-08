From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:26:06 +0200
Subject: [Buildroot] [PATCH/next v3 6/7] package/squeezelite: Fix build
 with FFmpeg 4.0
In-Reply-To: <20180825073118.14980-6-bernd.kuhls@t-online.de>
References: <20180825073118.14980-1-bernd.kuhls@t-online.de>
 <20180825073118.14980-6-bernd.kuhls@t-online.de>
Message-ID: <20180908232606.4cb41792@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 09:31:17 +0200, Bernd Kuhls wrote:
> Git-formatted patch 0003, added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: re-integrated in ffmpeg bump series
> v2: split patch from v1, git-formatted patches 3 & 4, added license hash

I've dropped the license file hash addition (should be done in a
separate commit), and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
