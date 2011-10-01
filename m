From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Oct 2011 13:20:42 +0200
Subject: [Buildroot] [PATCH 4/4] Add the libplayer package
In-Reply-To: <4E863926.50903@free-electrons.com>
References: <cover.1317210509.git.maxime.ripard@free-electrons.com>
 <fe12fce8c39412837610eba989ec416ec7049e35.1317210509.git.maxime.ripard@free-electrons.com>
 <20110930214449.5139eb84@skate> <4E863926.50903@free-electrons.com>
Message-ID: <20111001132042.3704846a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 30 Sep 2011 23:48:22 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> > This looks like a normal ./configure invocation. Why don't you use the
> > default foo_CONFIGURE_CMDS provided by the autotargets infrastructure ?
> 
> The configure script breaks if we pass --target or --host, I did this to 
> avoid it.

Hum, ok. Then a comment on top of the LIBPLAYER_CONFIGURE_CMDS would be
good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
