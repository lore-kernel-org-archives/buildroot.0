From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 22:18:31 +0100
Subject: [Buildroot] [PATCH] package/tmux: new package
In-Reply-To: <1390605314-14452-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 25 Jan 2014 00:15:14 +0100")
References: <1390605314-14452-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87wqhj24bc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/Config.in      |  3 +++
 >  package/tmux/Config.in |  9 +++++++++
 >  package/tmux/tmux.mk   | 13 +++++++++++++
 >  3 files changed, 25 insertions(+)
 >  create mode 100644 package/tmux/Config.in
 >  create mode 100644 package/tmux/tmux.mk

 > +###############################################################################
 > +#
 > +# tmux
 > +#
 > +###############################################################################
 > +
 > +TMUX_VERSION = 1.8
 > +TMUX_SITE = http://downloads.sourceforge.net/tmux
 > +TMUX_LICENSE = BSD
 > +TMUX_LICENSE_FILES = COPYING

There's no COPYING and the license header of tmux.c is ISC style, so I
changed it to:

TMUX_LICENSE = ISC
TMUX_LICENSE_FILES = README

And committed, thanks.

-- 
Bye, Peter Korsgaard
