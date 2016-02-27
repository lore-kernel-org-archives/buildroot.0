From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Feb 2016 16:34:36 +0100
Subject: [Buildroot] [PATCH 1/1] gstreamer: add missing plugin hash files
In-Reply-To: <1456486925-16824-1-git-send-email-casantos@datacom.ind.br>
References: <1456486925-16824-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160227163436.1b5e19f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Santos,

On Fri, 26 Feb 2016 08:42:05 -0300, Carlos Santos wrote:
> Hash files for
> 
>   - gst-dsp
>   - gst-omapfb
>   - gst-plugin-x170
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/gstreamer/gst-dsp/gst-dsp.hash                 | 2 ++
>  package/gstreamer/gst-omapfb/gst-omapfb.hash           | 2 ++
>  package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash | 2 ++
>  3 files changed, 6 insertions(+)
>  create mode 100644 package/gstreamer/gst-dsp/gst-dsp.hash
>  create mode 100644 package/gstreamer/gst-omapfb/gst-omapfb.hash
>  create mode 100644 package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
