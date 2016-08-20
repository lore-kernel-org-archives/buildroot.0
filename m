From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 20 Aug 2016 14:04:46 -0400
Subject: [Buildroot] rust?
Message-ID: <CAK7rcp_PjZ996EDpV6jH_Bf+MQ6d37Sc+xd67g5Fyup4J-F2Bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So, is anybody following this:


https://github.com/elebihan/buildroot.git

?

I'm trying to use it to compile a particular version of rust and cargo
with the buildroot internal cross compilers in order to add a uclibc
target. There doesn't seem to be much direction on how to use the
scripts included in order to add a particular target. In particular, I
had to make some modifications to even make it useful to enable uclibc
as a potential target. Does someone have an example invocation that
can be used to derive a valid buildroot target? Because I got errors
trying to use the python script. I think that's all that I need, is an
example.

The other changes around using a particular rust version I can make on my own.
