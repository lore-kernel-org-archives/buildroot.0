From: Chris Bare <chris@bareflix.com>
Date: Fri, 1 May 2009 12:14:25 -0400 (EDT)
Subject: [Buildroot] avr32 support question
Message-ID: <20090501162116.B66CF1C8467@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm working with the Atmel NGW100 using the buildroot from their website which
is based on buildroot 20081218.

Recently I've seen some interesting patches go in (like for reducing the size
of openssl). But when I compare the latest to the Atmel version, I see things
missing, like the avr32-asm patch for openssl.

I realize that ideally that should be integrated upstream in the openssl
package, but I'm curious what other avr32 users are doing right now.

Currently I'm sticking with the Atmel version, and have pulled in a few
package updates from the buildroot head, but that doesn't seem like a good
long term solution.

Any thoughts or suggestions?
-- 
Chris Bare
chris at bareflix.com
