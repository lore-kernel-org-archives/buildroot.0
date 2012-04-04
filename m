From: Qais Yousef <Qais.Yousef@imgtec.com>
Date: Wed, 4 Apr 2012 12:11:20 +0100
Subject: [Buildroot] [PATCH] New Package: latencytop
In-Reply-To: <20120404104203.GB3282@tarshish>
References: <1333535085-10290-1-git-send-email-qais.yousef@imgtec.com>
 <20120404104203.GB3282@tarshish>
Message-ID: <0D107966AF6D79418315B7C5549F4B51033CBD17@lemail1.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > +# NOTE: GTK is heavy weight, we intentionally build the text
> > +(ncurses) # version only define LATENCYTOP_BUILD_CMDS
> > +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
> > +		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)"
> HAS_GTK_GUI=0 -C $(@D)
> 
> You can use $(TARGET_CONFIGURE_OPTS), which includes CC, LD, and
> PKG_CONFIG.
> 
> baruch
> 

Thanks for the tip. I'll update and repost.

Qais
