From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 07 Jul 2011 14:47:04 +0200
Subject: [Buildroot] fPIC problem after changing gcc version
Message-ID: <1310042824.2076.21.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've changed the gcc version in our buildroot from 4.3.6 to 4.5.3 and
now all(?) binaries that use threads fail to start with the following
error:

Can't modify /lib/libpthread.so.0's text section. Use GCC option -fPIC
for shared objects, please.

Is this a known problem? Do I perhaps also need to change something in
the uCLibC configuration for this compiler update?


Thanks,
Sven
