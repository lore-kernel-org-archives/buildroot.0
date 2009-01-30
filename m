From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 08:05:45 +0100
Subject: [Buildroot] buildroot questions
In-Reply-To: <20090129151144.7e82de38@INDYZONE.dhcp.2wire.com> (Jackson
	Jones's message of "Thu\, 29 Jan 2009 15\:11\:44 -0800")
References: <20090129151144.7e82de38@INDYZONE.dhcp.2wire.com>
Message-ID: <87d4e5p92u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jackson" == Jackson Jones <jjones@2wire.com> writes:

Hi,

Please mail the buildroot mailing list in the future so other people
can help as well.

 Jackson> Peter,

 Jackson> I had a couple of quick questions about build root. I am
 Jackson> using the rc2 that is on the site. Is it a known bug that
 Jackson> the libgcj does not build and causes a build error?

I'm afraid the java stuff may have bitrotted or is incomplete - I have
never tried it in all the time I have been working on buildroot, and I
don't ever remember any questions and/or patches about it on the list.

Anyone else?

 Jackson> The other question I have is that I noticed that the ntpl
 Jackson> library is not merged with uClibc, so selecting ntpl results
 Jackson> in an error when the sysdep.h cannot be found. Is there a
 Jackson> patch to add this in. I am trying to build a cross compiler
 Jackson> to mipsel (for a broadcom chipset). We are currently using a
 Jackson> glibc based toolchain (home grown), but want to switch to
 Jackson> uClibc for the size advantage. Our platform is written in
 Jackson> C/C++, but the application side is written in Java (compiled
 Jackson> gcj).

The ntpl branch of uclibc is supposed to be merged real-soon-now, but
I don't actually know much more about it. I would suggest to stick to
the default linuxthreads for now.

 Jackson> Thanks for you time,

You're welcome.

-- 
Bye, Peter Korsgaard
