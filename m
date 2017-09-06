From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 12:41:25 +0200
Subject: [Buildroot] [PATCH] package/nvidia-driver: install an egl.pc
In-Reply-To: <20170829204959.17003-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Tue, 29 Aug 2017 22:49:59 +0200")
References: <20170829204959.17003-1-yann.morin.1998@free.fr>
Message-ID: <87wp5cf6sq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > A lot of packages expect an egl.pc to decide that EGL is available. So,
 > provide one.

 > As suggested by Alexandre, use the one from nvidia-tegra23 as template.

 > Reported-by: Alexandre Maumen? <alexandre@maumene.org>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Alexandre Maumen? <alexandre@maumene.org>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Note: ideally, we should also provide a glesv2.pc, and possibly a
 > wayland-egl.pc as well. That can be folowup patches.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
