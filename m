From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 21:51:35 +0100
Subject: [Buildroot] [PATCH] package/ti-gfx: do not forcefully remove
	source dir on extract
In-Reply-To: <1393440003-29380-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 26 Feb 2014 19:40:03 +0100")
References: <1393440003-29380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <871typegx4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ti-gfx uses custom extract commands, which first and foremost removes
 > the source dir unconditionally.

 > Thee side-effect of this is that make will re-extract, re-patch and
 > probably re-build ti-gfx at each run.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Spenser Gilliland <spenser@gillilanding.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
