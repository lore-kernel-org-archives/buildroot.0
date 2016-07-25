From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 25 Jul 2016 13:36:07 -0300
Subject: [Buildroot] [PATCH] tunctl: new package
In-Reply-To: <20160723225727.7d8cfe80@free-electrons.com>
References: <1469283530-24618-1-git-send-email-sergio.prado@e-labworks.com>
 <20160723225727.7d8cfe80@free-electrons.com>
Message-ID: <CANu7NGu_jDbUkw9mtJecsYnvz+OzY18t=3P1vtKNYQC5U6FauA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > +define TUNCTL_BUILD_CMDS
> > +     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) tunctl
>
> Using $(TARGET_CONFIGURE_OPTS) is preferred over manually passing CC
> and LD, so I've changed this and applied. Thanks!

Thanks Thomas!

Should we update the Buildroot manual since it is still using CC and LD in
the generic-package tutorial example?

Best regards,

Sergio Prado

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160725/1fafff3c/attachment.html>
