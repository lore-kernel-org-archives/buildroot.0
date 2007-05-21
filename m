From: christophe Dion <christophe.dion@gmail.com>
Date: Mon, 21 May 2007 11:52:05 +0200
Subject: [Buildroot] __ctype_b undefined reference after adding fontconfig
	support
Message-ID: <81dcc7880705210252w60812f9at2093ed884e2062a4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this bug exists for 6 month and nobody has fixed it.

Either there are too few people interested with X (or tinyX) on Builroot to fix
it

or it is a big problem, difficult to solve.



I'm not good enough to correct it.

So I wait and read the mailing list, hopping for a correction so I can go
further in my project.

Christophe

>All - I will attempt to provide as much detail and if there is more than
>should be added, I'll be happy to do so.
>
>
>
>In wanting to use Matchbox as added by Assen, I enabled those packages which
>require fontconfig and freetype.  In doing so, I received the following
>error which I found as reported a couple of weeks ago.  I am wondering if
>anyone else has encountered this and how to address it.  If there is a
>version of buildroot that I can go back to, then I'd be happy to do it.  I
>have binutils 2.17, uclibc 0.9.29 and gcc 4.1.2 selected as the toolchain
>for buildroot.



>Below is the output and the bug as reported by ALEXANDER WOLD.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070521/21c1a066/attachment.htm 
