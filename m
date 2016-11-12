From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Nov 2016 10:21:42 +0100
Subject: [Buildroot] Question about Compilation Flags
In-Reply-To: <CAHBw83d+5FzcxpBxmeDM=-uUyMyXLw8pDeywoYrF91pV8wR7ag@mail.gmail.com>
References: <CAHBw83fzS2uZUXUrpF6+Q41G3gUEPg5uW3DXu=YauG447FjDtA@mail.gmail.com>
 <20161111150343.74bfc8b1@free-electrons.com>
 <CAHBw83d+5FzcxpBxmeDM=-uUyMyXLw8pDeywoYrF91pV8wR7ag@mail.gmail.com>
Message-ID: <20161112102142.5fba57e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Nov 2016 13:06:11 +0530, Anand Sivaram wrote:

> Thank you very much for the reply.  I think BR2_TARGET_OPTIMIZATION and
> BR2_TARGET_LDFLAGS are
> better solutions than what I did in config/Makefile.in
> 
> I will try lighttpd.mk changes as you suggested.
> 
> These are the numbers I found without changing lighttpd in a special way.
> 
> du -ks output/target/ (default buildroot for mips without
> function/data/gc-section)
> 26188   output/target/
> du -ks output/target/ (with function/data/gc-sections)
> 25012   output/target/
> 
> That gives a saving of 1176 KB then.

That's not bad indeed, about 4.4% space saving.

Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
