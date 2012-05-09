From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 May 2012 08:34:29 +0200
Subject: [Buildroot] [PATCH v3 02/22] gettext: warn that legal-info is
 not implemented
In-Reply-To: <CAAXf6LW4v94Z8U8wtfCkdRQZ85qEM4p2GQNvAsDgijSW_ZSvYw@mail.gmail.com>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-2-git-send-email-luca@lucaceresoli.net>
 <CAAXf6LW4v94Z8U8wtfCkdRQZ85qEM4p2GQNvAsDgijSW_ZSvYw@mail.gmail.com>
Message-ID: <20120509083429.3c9f4010@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 9 May 2012 08:21:25 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Moreover, will this be added to each package for which no legal info
> is provided? What about making this message the default by putting it
> in pkg-gentargets.mk, if no suitable variables were defined?

It is already the case, but the point is that gettext has not yet been
converted to gentargets (but Maxime Ripard and Samuel Martin have been
sending patches about this recently).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
