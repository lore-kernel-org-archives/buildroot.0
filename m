From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Thu, 8 Jan 2009 11:22:45 -0800 (PST)
Subject: [Buildroot] Buildroot maintainer and stable releases
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
Message-ID: <702995.6698.qm@web58204.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net





----- Original Message ----
> From: Peter Korsgaard <jacmet@uclibc.org>
> To: buildroot at uclibc.org; andersen at codepoet.org
> Sent: Monday, January 5, 2009 1:18:01 PM
> 
> I offer to do something about both: Take over maintainership and get
> atual stable releases out the door (if Erik and the other developers
> agree).
> 
> What is the plan? Getting the first release out is always the hardest,
> so I would on purpose aim low for the first release and get it out
> soon (February). The target is to get all architectures to build (and
> run where hw is available for test) using the default toolchain config
> and busybox, anything else is just a bonus. I will put out the first
> release candidate early next week, so from then on please don't add
> anything else than bugfixes until the release it out. I believe in
> time based releases, so any architectures that we cannot fix in time
> will simply be disabled in kconfig (E.G. depend on BROKEN).
> 
> After that I would like us to move to a regular release schedule every
> 3 months with 2 months of development and 1 month of stabilization.
> 
> The big issue with buildroot quality control is the mindblowing number
> of configuration combinations and specialized hardware needed to
> test. I am therefore convinced we need to leverage qemu and
> agressively deprecate legacy versions / packages + actively work with
> upstream to keep the number of patches low. I think our users would
> also be happier with a less ambitious project that wouldn't break left
> and right, instead of the current situation.
> 
> Let me know what you think.
> 

Hi All,

I think this is a great plan.

I am a computer consultant and jump around to many jobs, most on Linux. I used buildroot sometime in 2004 or so, and someone else had already done the heavy lifting and had a released product. I needed to upgrade the kernel to something like 2.6.12 to get better USB support. I was completely blown away by the completeness of the buildroot concept. Everything is built including the compiler! Upgrading the BSP for the client and even adding a few apps/packages was great.

Recently I was talking with another potential client about doing a new product. I thought of trying buildroot again. I first tried to build a system based on some old motorola 823 hardware I had around. I couldn't even get the compiler to build without obscure missing files etc. So then I thought probably no one was using that processor so I decided to try what I thought was a well supported hardware, one of the Atmel at91.. arm systems. I could then build the toolchain, but the busybox/packages in the standard config would not build, so I gave up.

When starting a new embedded system it is very nice to be able to get a minimal system up and running and then add packages and features. Just getting Linux, Busybox and a file system working is an incredible hurdle. Having a release that is known to build and run is incredibly valuable. There are so many build environment gotcha's (ubuntu dash vs bash was one I remember), that knowing something should work really helps in finding the issues and fixing them.

Better docs would help. Even a buildroot newby wiki would help greatly.

So anyway Peter, if you are willing to take this huge effort on, great. Thank you.

Steve



      
