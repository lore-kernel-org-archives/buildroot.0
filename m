From: Gertjan Hofman <gertjan_hofman@yahoo.com>
Date: Fri, 31 Aug 2007 15:13:01 -0700 (PDT)
Subject: [Buildroot] Q: using external cross compilers
Message-ID: <449748.91796.qm@web32612.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear Sir(s),

I would like to use an existing cross compiler tool
chain, located on my system at:

/opt/timesys/toolchains/armv5l-linux/bin/armv5l-linux-gcc

(and similary for g++).
It's not entirely clear how to do this. Attempts such
as:
  make
HOSTCXX=/opt/timesys/toolchains/armv5l-linux/bin/armv5l-linux-gcc

HOSTCC=/opt/timesys/toolchains/armv5l-linux/bin/armv5l-linux-gcc

and setting exernal toolchain option in menuconfig
give me things like:/bin/sh:-gcc : not found
Clearly I am not doing the right thing.

An example would be really appreciated

Cheers

Gertjan








       
____________________________________________________________________________________
Need a vacation? Get great deals
to amazing places on Yahoo! Travel.
http://travel.yahoo.com/
