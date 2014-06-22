From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:19:40 +0200
Subject: [Buildroot] [PATCH] gst-ffmpeg: fix build on armv6 without
 thumb2 (e.g. RaspberryPi)
In-Reply-To: <1403133378-28417-1-git-send-email-arnout@mind.be>
References: <1403133378-28417-1-git-send-email-arnout@mind.be>
Message-ID: <20140622191940.7e905db5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Thu, 19 Jun 2014 01:16:18 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Cc: Marco Trapanese <marcotrapanese@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I only build-tested this - Marco, please test it properly. Although, you
> probably don't even use ac3 so the failing code won't be executed.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...3_01-arm-avoid-using-the-movw-instruction.patch | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/gstreamer/gst-ffmpeg/gst-ffmpeg-0.10.13_01-arm-avoid-using-the-movw-instruction.patch

Thanks, applied. In the process, I've renamed the existing patch and
your patch to follow the patch naming convention.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
