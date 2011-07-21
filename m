From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 21 Jul 2011 08:23:48 -0700
Subject: [Buildroot] a special ramdisk
In-Reply-To: <877h7b1x24.fsf@macbook.be.48ers.dk>
References: <CALo-6+iK-jHqjFm4oy11BeQKDJd7LyjoOXgeixmrRGwDMd6ZBw@mail.gmail.com>
 <877h7b1x24.fsf@macbook.be.48ers.dk>
Message-ID: <CALo-6+hPuBVwbnShd20vn2=7d-8TA5WSidBoMQnUGoW5U-31RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Peter, this looks very promising.

On Thu, Jul 21, 2011 at 8:18 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:
>
> ?Charles> Gentlemen:
> ?Charles> I'm looking for a little advice on a non-buildroot issue. An answer of
> ?Charles> RTFM would be fine but a URL for the FM would help.
>
> ?Charles> I need to use 2MByte of battery backed SRAM in my PPC8321 design
> ?Charles> running Linux built with buildroot. The requirement is that this SRAM
> ?Charles> have a file system on it so that programs can
> ?Charles> open()/read(),write(),close(). The RAM is at a specific address and I
> ?Charles> can map it into memory just above the main DDRRAM.
>
> ?Charles> So, the question is: ?"Is there a way to create a ramdisk at a
> ?Charles> specific address, perhaps using /dev/mem, mmap and other utilities?"
>
> That sounds like pramfs:
>
> http://pramfs.sourceforge.net/
>
> Never used it though.
>
> --
> Bye, Peter Korsgaard
>



-- 
Charles Krinke
