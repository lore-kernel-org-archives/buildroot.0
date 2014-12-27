From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 22:49:04 +0100
Subject: [Buildroot] Pending "big" patch series
In-Reply-To: <20140923213752.GA5923@itchy>
References: <20140914125321.0d68b842@free-electrons.com>
 <20140923200255.1be119c9@free-electrons.com>
 <20140923213752.GA5923@itchy>
Message-ID: <20141227224904.476d3ea5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Tue, 23 Sep 2014 23:37:52 +0200, Eric Le Bihan wrote:

> I had a quick look at the webkit patch. Webkit is a strange beast with issues
> when building with parallelism activated. When building version 2.4.3, I
> encountered the bug mentioned in the commit log, and when I bumped to 2.4.5,
> I've found more parallel build issues (and some ARM ASM ones too).
> 
> It looks like version 2.6.0 is on its way. The build system now uses cmake
> instead of autotools. I'll try a bump to 2.5.90 to see if the issues are
> solved.

We're now at Webkit 2.7.3. Do you have any updates about bumping the
webkit package? We still have the old patches from Hadrien Boutteville
in patchwork: http://patchwork.ozlabs.org/patch/375495/ and
http://patchwork.ozlabs.org/patch/375494/. It would be good to be able
to get rid of them at some point by having a version that fully works
and that can therefore be applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
