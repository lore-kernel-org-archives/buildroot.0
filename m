From: Chris Bare <chris@bareflix.com>
Date: Fri, 22 May 2009 10:25:53 -0400 (EDT)
Subject: [Buildroot] hang generating DSA keys
Message-ID: <20090522142624.2FEF618005F@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is really odd. I'm using the same buildroot code as I have been for
weeks, but after flashing my latest code to my Atmel ngw100, it hang in the
first boot at this step:

Generating DSA Key...
THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!

Generating public/private dsa key pair.

I let it sit overnight and it never finished. I remember seeing some mention
of this being an entropy problem. I tried pinging the board, but that didn't
seem to help.

Any idea why this would suddenly start with the same basic setup that worked
before?
How do I get it to finish generating the key?
-- 
Chris Bare
chris at bareflix.com
