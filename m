From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 14:51:51 +0200
Subject: [Buildroot] [PATCH v8 1/7] package/opencv: add a choice for
 selecting gstreamer support
In-Reply-To: <1436089229-21103-2-git-send-email-s.martin49@gmail.com>
References: <1436089229-21103-1-git-send-email-s.martin49@gmail.com>
 <1436089229-21103-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150705145151.7dbea4cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  5 Jul 2015 11:40:23 +0200, Samuel Martin wrote:
> OpenCV 3.0 support both gstreamer-0.10 and gstreamer-1.x, but only one
> is used at the time.
> 
> This patch turns the gstreamer support into a choice, in order to prepare
> adding the support for gstreamer-1 in a following patch.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> changes v7->v8:
> - fix  depends on comments (Yann)
> - fix help text (Yann)
> - update a/r/t tags

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
