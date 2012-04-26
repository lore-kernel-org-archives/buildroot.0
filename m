From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 26 Apr 2012 17:42:01 +0000 (UTC)
Subject: [Buildroot] How do you add to library path?
Message-ID: <jnc1d9$t1p$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What's the right way to permanently add a directory to the search path
for dynamic libraries?  (Preferably at build-time, rather than at
run-time.)

I've added the directory path to /etc/ld.so.conf using a post-build
script. But, that file seems to be ignored at boot time (and there is
no "ldconfig" to run even if I wanted to).

I suppose I could set LD_LIBRARY_PATH globally, but for performance
reasons, I'd prefer that the new path went into /etc/ld.so.cache. [I'm
not sure how one sets a global environment variable anyway.]

There have been several threads about this in the past, but none of
them seemed to offer any answers...

-- 
Grant Edwards               grant.b.edwards        Yow! I want a VEGETARIAN
                                  at               BURRITO to go ... with
                              gmail.com            EXTRA MSG!!
