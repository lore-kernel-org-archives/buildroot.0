From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Jan 2014 22:23:46 +0100
Subject: [Buildroot] [PATCH] gst-ffmpeg: fix build for xtensa
In-Reply-To: <c047dbb77048875f512696ec613ef7d204724753.1390214020.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 20 Jan 2014 12:33:40 +0200")
References: <c047dbb77048875f512696ec613ef7d204724753.1390214020.git.baruch@tkos.co.il>
Message-ID: <87iotejqjh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Since commit 6ea49a23df3 (gst-ffmpeg: Use internal libav instead of external
 > ffmpeg) gst-ffmpge uses its internal libav. This requires the same fix for
 > xtensa like ffmpeg got in commit 4ec35e76b8a3 (ffmpeg: fix build for xtensa).

 > Fixes
 > http://autobuild.buildroot.net/results/08a/08a27891fd5336250f00e611a15ea45505985f67/.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
