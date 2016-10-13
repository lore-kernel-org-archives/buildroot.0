From: Pascal Speck <kernel@iktek.de>
Date: Thu, 13 Oct 2016 15:05:09 +0200
Subject: [Buildroot] [ BUG ] Gzip shell configuration ?
Message-ID: <296b5618-884d-cb49-5cfb-ba74b05b1961@iktek.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear List,

in my current Buildroot-Setup (2016.08) I'm experiencing the same problem as mentioned in:

http://lists.busybox.net/pipermail/buildroot/2015-September/139785.html

On my Buildsystem the gzip-1.8 Makefile is changing the /bin/sh in the scripts to /bin/bash as the $(SHELL) variable expands to /bin/bash, which is basically right...

Unfortunately I don't like to have bash on my target system. Is there a known fix for this?

Regards
Pascal Speck
