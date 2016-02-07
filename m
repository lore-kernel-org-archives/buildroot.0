From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:32:18 +0100
Subject: [Buildroot] [PATCH] package/yad: fix the dependency on gtk3
In-Reply-To: <1454865354-13825-1-git-send-email-romain.naour@gmail.com>
References: <1454865354-13825-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160207233218.5295a172@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun,  7 Feb 2016 18:15:54 +0100, Romain Naour wrote:
> As 9b17d8285096087bff8543d79e8a2b6ea0810192 states, yad
> needs gtk3-x11. So yad must depends on BR2_PACKAGE_LIBGTK3_X11
> instead of BR2_PACKAGE_LIBGTK3 only.
> 
> Fixes:
> http://autobuild.buildroot.net/results/049/0490f206eb9bf6ae8729caceaea274bf7912413c
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Gustavo had already submitted the same patch:

  http://patchwork.ozlabs.org/patch/577916/

I've marked yours as Rejected, and applied Gustavo's patch instead.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
