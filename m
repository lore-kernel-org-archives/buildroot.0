From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Thu, 15 Sep 2011 11:03:12 +0100
Subject: [Buildroot] Host / Target system types
Message-ID: <4E71CD60.1010609@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have just cloned the latest git master and successfully compiled buildroot for my AVR32 target.

But I have noticed a slight (annoying) change ... the "target system type" used to be "avr32-linux-"
and it's now changed to "avr32-unknown-linux-".

This has the effect of changing the gcc compiler from "avr32-linux-g++" to
"avr32-unknown-linux-g++", and so all my makefiles no longer work.

I *could* change my makefiles, but I'd rather fix the problem.

I also noticed that the host target types are also listed as "unknown", so we have:-

checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu
checking target system type... x86_64-unknown-linux-gnu

BTW this is on 64bit Ubuntu 11.04.

Can anyone help ?

Regards
Mark Jackson
