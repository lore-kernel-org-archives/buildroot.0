From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 21 Jul 2011 06:56:43 -0700
Subject: [Buildroot] a special ramdisk
Message-ID: <CALo-6+iK-jHqjFm4oy11BeQKDJd7LyjoOXgeixmrRGwDMd6ZBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gentlemen:

I'm looking for a little advice on a non-buildroot issue. An answer of
RTFM would be fine but a URL for the FM would help.

I need to use 2MByte of battery backed SRAM in my PPC8321 design
running Linux built with buildroot. The requirement is that this SRAM
have a file system on it so that programs can
open()/read(),write(),close(). The RAM is at a specific address and I
can map it into memory just above the main DDRRAM.

So, the question is:  "Is there a way to create a ramdisk at a
specific address, perhaps using /dev/mem, mmap and other utilities?"

If I had a couple of google search terms that lead to some clues where
someone else has solved a similar problem, that would help.

-- 
Charles Krinke
