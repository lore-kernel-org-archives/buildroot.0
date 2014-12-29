From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 14:34:02 +0100
Subject: [Buildroot] building native gcc for target
In-Reply-To: <CAHBHQYO9BLD1tJKxaR3z5StYXEtUvwBwQZfFNSzpZEcqHyR4gg@mail.gmail.com>
References: <CAHBHQYO9BLD1tJKxaR3z5StYXEtUvwBwQZfFNSzpZEcqHyR4gg@mail.gmail.com>
Message-ID: <20141229143402.55e5900d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Boris Lenin,

On Mon, 29 Dec 2014 15:27:40 +0200, Boris Lenin wrote:

> I want to have a gcc binary in my target, so I can compile ELFs inside it.
> This is for compiling using uClibc as suggested here:
> http://www.uclibc.org/toolchains.html
> 
> But after I make, I have no gcc in output/target/usr/bin/gcc
> I also don't have an option to include gcc in menuconfig->Target
> packages->Development Tools
> 
> How can I have a working gcc that's using uClibc inside my new rootfs?

This is no longer supported in Buildroot. See
http://buildroot.org/downloads/manual/manual.html#faq-no-compiler-on-target
for more details about this topic.

You should either cross-compile your applications/libraries, or use a
full-featured Linux distribution on your system.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
