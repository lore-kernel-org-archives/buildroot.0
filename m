From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Jul 2011 17:18:59 +0200
Subject: [Buildroot] a special ramdisk
In-Reply-To: <CALo-6+iK-jHqjFm4oy11BeQKDJd7LyjoOXgeixmrRGwDMd6ZBw@mail.gmail.com>
 (Charles Krinke's message of "Thu, 21 Jul 2011 06:56:43 -0700")
References: <CALo-6+iK-jHqjFm4oy11BeQKDJd7LyjoOXgeixmrRGwDMd6ZBw@mail.gmail.com>
Message-ID: <877h7b1x24.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> Gentlemen:
 Charles> I'm looking for a little advice on a non-buildroot issue. An answer of
 Charles> RTFM would be fine but a URL for the FM would help.

 Charles> I need to use 2MByte of battery backed SRAM in my PPC8321 design
 Charles> running Linux built with buildroot. The requirement is that this SRAM
 Charles> have a file system on it so that programs can
 Charles> open()/read(),write(),close(). The RAM is at a specific address and I
 Charles> can map it into memory just above the main DDRRAM.

 Charles> So, the question is:  "Is there a way to create a ramdisk at a
 Charles> specific address, perhaps using /dev/mem, mmap and other utilities?"

That sounds like pramfs:

http://pramfs.sourceforge.net/

Never used it though.

-- 
Bye, Peter Korsgaard
