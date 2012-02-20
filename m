From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 20 Feb 2012 20:41:31 +0000 (UTC)
Subject: [Buildroot] Where does post-build script belong?
Message-ID: <jhub5r$smv$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to use a post-build script to fix up the init.d/S59snmpd
file, but I can't figure out what the post-build script path should
be.

It would be awfully nice if the help text for "path" config options
explained what directory the path is relative to. Alternatively, it
might be nice if there were some variables that could be used in
user-configured paths to anchor the path to specific points in the
build, output, or source tree.

Putting an absolute path in a config file doesn't really seem like a
workable option.

-- 
Grant Edwards               grant.b.edwards        Yow! Now, let's SEND OUT
                                  at               for QUICHE!!
                              gmail.com            
