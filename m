From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 22:31:45 +0200
Subject: [Buildroot] rust?
In-Reply-To: <CAK7rcp_PjZ996EDpV6jH_Bf+MQ6d37Sc+xd67g5Fyup4J-F2Bw@mail.gmail.com>
References: <CAK7rcp_PjZ996EDpV6jH_Bf+MQ6d37Sc+xd67g5Fyup4J-F2Bw@mail.gmail.com>
Message-ID: <20160820223145.497a1f2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 14:04:46 -0400, Kenneth Adam Miller wrote:
> So, is anybody following this:
> 
> 
> https://github.com/elebihan/buildroot.git
> 
> ?

We don't need to follow it: Eric is a regular Buildroot contributor,
and he has already submitted the rust support in Buildroot:

  https://patchwork.ozlabs.org/patch/648613/
  https://patchwork.ozlabs.org/patch/648614/

> I'm trying to use it to compile a particular version of rust and cargo
> with the buildroot internal cross compilers in order to add a uclibc
> target. There doesn't seem to be much direction on how to use the
> scripts included in order to add a particular target. In particular, I
> had to make some modifications to even make it useful to enable uclibc
> as a potential target. Does someone have an example invocation that
> can be used to derive a valid buildroot target? Because I got errors
> trying to use the python script. I think that's all that I need, is an
> example.

I'm Cc'ing Eric, hopefully he can help with those questions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
