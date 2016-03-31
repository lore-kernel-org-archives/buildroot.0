From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:46:02 +0200
Subject: [Buildroot] [PATCH 2/2] gst1-libav: add license info
In-Reply-To: <1459366600-21925-2-git-send-email-gustavo@zacarias.com.ar>
References: <1459366600-21925-1-git-send-email-gustavo@zacarias.com.ar>
 <1459366600-21925-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160331034602.22cd98e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Mar 2016 16:36:40 -0300, Gustavo Zacarias wrote:
> Now that we use unbundled ffmpeg the licensing becomes much easier.
> Relevant code is under ext/*, which according to COPYING and comments is
> GPLv2+, except for ext/libswscale/gstffmpegscale.c which is LGPLv2+ -
> however that's not built/used when using system ffmpeg.
> 
> The code under gst-libs/ is the bundled ffmpeg itself.
> 
> Tests are under LGPLv2+ as well but we don't build them since we
> disabled gst-check support in the gstreamer1 package.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gstreamer1/gst1-libav/gst1-libav.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
