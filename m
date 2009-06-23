From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 23 Jun 2009 20:05:06 +0000 (UTC)
Subject: [Buildroot] How to rebuild following .config change?
Message-ID: <h1rchh$9du$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several times in the past week, I've gotten things terminally
broken: where it's impossible to build after doing a "make
menuconfig" or "make uclibc-menuconfg" and changing a
configuration setting.

It appears that you can't reliably make a configuration change
and then do a "make".

Doing a "make clean" doesn't appear to be enough either, since
often a "make" still fails or doesn't rebuild certain things.

You can do a "distclean", but then all the sources get
re-downloaded and toolchains re-built -- which takes a _long_
time.

How does one re-build appropriate packages after a
configuration change.

-- 
Grant Edwards                   grante             Yow! If elected, Zippy
                                  at               pledges to each and every
                               visi.com            American a 55-year-old
                                                   houseboy ...
