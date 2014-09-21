From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:47:44 +0200
Subject: [Buildroot] [PATCH v3 1/8] opencv: rework V4L/libv4l support
In-Reply-To: <1409515750-10289-2-git-send-email-s.martin49@gmail.com>
References: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
 <1409515750-10289-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140921224744.06f9adf5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 31 Aug 2014 22:09:03 +0200, Samuel Martin wrote:
> Starting with the 2.4.7 release, for V4L support, OpenCV does not
> requires a libv4l dependency for its V4L support.
> 
> So, it now provides 2 distincts knobs for this: WITH_V4L and a new
> one: WITH_LIBV4L.
> 
> This patch takes advantage of this new knob and libv4l support is
> now automatically enabled only if the libv4l package is enabled.
> 
> In OpenCV, the logic behind this is:
> - using libv4l if available,
> - otherwise, use v4l2 or v4l API from the kernel if available.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Thanks, applied, after tweaking the commit as suggested by Yann (do not
do a gratuitous reformatting).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
