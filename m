From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sun, 8 May 2016 22:26:10 +0200
Subject: [Buildroot] [PATCH 11/34] reproducibility/vim: make vim
 reproducible
In-Reply-To: <20160507153006.16624d0e@free-electrons.com>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-11-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507153006.16624d0e@free-electrons.com>
Message-ID: <20160508202610.GU13285@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 07, 2016 at 03:30:06PM +0200, Thomas Petazzoni wrote:
> > +define VIM_FIX_AWK_REFERENCE
> > +	sed -i 's,^#!.*awk,#!/usr/bin/awk,' $(TARGET_DIR)/usr/share/vim/vim74/tools/mve.awk
> > +endef
> > +
> > +VIM_POST_INSTALL_TARGET_HOOKS += VIM_FIX_AWK_REFERENCE
> 
> Do we even need this awk script installed?

How should I know, I am an emacs user...

-- 
					    Gilles.
https://click-hack.org
