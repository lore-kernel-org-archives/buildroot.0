From: Kai Frank <kafr0001@stud.fh-kl.de>
Date: Thu, 20 May 2010 22:47:20 +0200
Subject: [Buildroot] cannot login to shell
Message-ID: <7e65c704c441011fe9f80ce01a139ca3.squirrel@post.fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm building a kernel and roofts (jffs2) for Atmel AT91RM9200.
Everything seems to build fine. When i boot the images i get the
"Welcome to buildroot" screen and a login prompt. When i press enter i get
something like "login on ttyS0". This also seems to be correct. But the it
returns to "Welcome to buildroot".
When i'm trying to pass an init=/bin/sh as boot oder kernel option i get
...
freeing init memory(92k)
cannot open an initial console
unable to execute /bin/sh
kernel panic... try passing init as an kernel option.

My /etc/passwd and /etc/shadow should by ok, because i manually edited the
/etc/shadow and add an encrypted password for root and then you need the
enter the correct password before it returns to "Welcome to buildroot".

Any ideas?

Best regards!
