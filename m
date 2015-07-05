From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 14:51:54 +0200
Subject: [Buildroot] [PATCH v8 2/7] package/opencv: add gstreamer-1.x
 support
In-Reply-To: <1436089229-21103-3-git-send-email-s.martin49@gmail.com>
References: <1436089229-21103-1-git-send-email-s.martin49@gmail.com>
 <1436089229-21103-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20150705145154.1d5eeeae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  5 Jul 2015 11:40:24 +0200, Samuel Martin wrote:
> Starting with the 2.4.10 release, OpenCV supports both Gstreamer-0.10
> and Gstreamer-1, but only one can be enabled at the same time (OpenCV
> chooses Gstreamer-1 over Gstreamer-0.10 when both are available).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> changes v7->v8:
> - fix depends on comments (Yann)
> - fix help text (Yann)
> - rework gst/gst1 if-block in opencv.mk (Yann)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
