From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Sep 2007 13:07:02 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <20070926102333.E52393004A@busybox.net> (ulf@uclibc.org's message
	of "Wed\, 26 Sep 2007 03\:23\:33 -0700 \(PDT\)")
References: <20070926102333.E52393004A@busybox.net>
Message-ID: <87d4w5n0rt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

Hi,

 ulf> +# BUG: In "OpenSuSE 10.2", dbus.h is at dbus-1.0/dbus/dbus.h
 ulf> +# instead of at "dbus/dbus.h"
 ulf> +# (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus) 

Huh, on the build host? Why would qtopia mess around with that?

-- 
Bye, Peter Korsgaard
