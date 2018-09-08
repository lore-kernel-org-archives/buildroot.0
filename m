From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:11:00 +0200
Subject: [Buildroot] [PATCH/next v3 4/7] package/mediastreamer: Fix
 build with FFmpeg 4.0
In-Reply-To: <20180825073118.14980-4-bernd.kuhls@t-online.de>
References: <20180825073118.14980-1-bernd.kuhls@t-online.de>
 <20180825073118.14980-4-bernd.kuhls@t-online.de>
Message-ID: <20180908231100.2277d382@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 09:31:15 +0200, Bernd Kuhls wrote:
> Added license hash.

Please don't add license hash in unrelated patches. When doing a
package bump, it's fairly OK, but mixed with ffmpeg 4.0 fixes,  that's
really odd.

I've applied after dropping the license file hash addition. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
