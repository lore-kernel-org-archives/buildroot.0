From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 2 May 2011 07:33:59 +0200
Subject: [Buildroot] Buildroot to generate config.site for Autotools
	packages?
Message-ID: <BANLkTimC6da=OB2TL=QWj8-ufX7ttdfNmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just found this:
http://www.gnu.org/software/hello/manual/autoconf/Site-Defaults.html

Maybe that's a preferable alternative to configure Autotools packages,
than the large set in _CONF_ENV?

Anyone got any experience from a config.site files?

I can see a pretty big benefit when developing and/or running
out-of-buildroot-tree builds.
