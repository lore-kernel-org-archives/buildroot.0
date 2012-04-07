From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 07 Apr 2012 22:39:52 +0200
Subject: [Buildroot] Problems when compiling gnutls and gst-plugins-base
	on arm (panda)
In-Reply-To: <87ty0vtign.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Sat, 07 Apr 2012 22:06:32 +0200")
References: <CAC2kKA9r0gZuP56HwuF_U0ZGyJP9hBBytcY8v5ruhp1jQsqL+A@mail.gmail.com>
 <87ty0vtign.fsf@macbook.be.48ers.dk>
Message-ID: <87pqbjtgx3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Peter> The linaro toolchain (and systemd) are very recent additions, so
 Peter> there might indeed be some issues with it. I had a quick look,
 Peter> and our external toolchain expects these libraries to reside
 Peter> inside the sysroot (which on linaro is detected as
 Peter> arm-linux-gnueabi/libc), and libstdc++ is in the lib dir
 Peter> instead.

This is btw only an issue with 2012.03 as they moved some files. 2012.02
is OK, so perhaps you could give that a try?

-- 
Bye, Peter Korsgaard
