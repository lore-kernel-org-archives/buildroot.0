From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 23:07:04 +0200
Subject: [Buildroot] [PATCH 02/11] package/weston: fix variable name
In-Reply-To: <9f47cbe09f7914213180912dc88020ca752299f5.1381269937.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 9 Oct 2013 00:09:48 +0200")
References: <cover.1381269937.git.yann.morin.1998@free.fr>
 <cover.1381269937.git.yann.morin.1998@free.fr>
 <9f47cbe09f7914213180912dc88020ca752299f5.1381269937.git.yann.morin.1998@free.fr>
Message-ID: <87bo2yxifb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> The weston package uses the $(WAYLAND_VERSION) variable instead of
 Yann> $(WESTON_VERSION).

 Yann> This went unnoticed for now, as we were using the same version for
 Yann> wayland and weston. But that's not always the case, since we have,
 Yann> for example: wayland-1.2.1 and weston-1.2.2, and no wayland-1.2.2.

 Yann> Fix this by using the correct variable.

Committed, thanks.

-- 
Bye, Peter Korsgaard
