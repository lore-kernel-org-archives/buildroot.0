From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 2 Feb 2018 14:35:24 +0100
Subject: [Buildroot] [PATCH v2 1/2] network-manager: Bump to version
 1.10.2
In-Reply-To: <20180202115635.0fdaab93@windsurf.lan>
References: <20180201234516.5031-1-petr.vorel@gmail.com>
 <20180202115635.0fdaab93@windsurf.lan>
Message-ID: <20180202133523.GA8864@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > +ifeq ($(BR2_PACKAGE_JANSSON),y)
> > +NETWORK_MANAGER_CONF_OPTS += --enable-ovs
> > +NETWORK_MANAGER_DEPENDENCIES += jansson
> > +else
> > +NETWORK_MANAGER_CONF_OPTS += --disable-ovs
> > +endif

> It is somewhat weird to introduce this here, and then add an explicit
> option in a second patch.
Oh, you're right.

> Perhaps PATCH 1/2 could just do --disable-ovs unconditionally, and
> PATCH 2/2 add the rest. If you agree, I can rework locally before
> applying, I understand it's a lot of nitpicking for such a small
> change :)
OK, please do it as I'm on a way to Fosdem, so I'd do it next week.
Thanks!


Kind regards,
Petr
