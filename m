From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 19:59:17 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <1432043386.4108.23.camel@synopsys.com> (Alexey Brodkin's message
 of "Tue, 19 May 2015 13:49:46 +0000")
References: <20150519063012.E7D2A100C5F@stock.ovh.net>
 <20150519100045.44f1b3a4@free-electrons.com>
 <1432043386.4108.23.camel@synopsys.com>
Message-ID: <87mw105tze.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

Hi,

 > Well this is sort of expected failure. Even though I have never tried
 > building vanilla Qt for ARC, but as it turned out that doesn't work.

 > But we've been sitting for a while on Qt4 patches that enable building
 > for and running on ARC. And now decision has been made to finally submit
 > those pretty simple patches upstream and in parallel (until patches are
 > accepted and the next minor release of Qt 4.x is cut.. if ever) add
 > patches in Buildroot so people may happily build and run Qt on ARC.

 > I'll send patches shortly.

Qt4? Really? Is upstream really accepting feature patches for Qt4
nowadays?

 > As for Qt5:
 >  [1] It requires tools with NPTL which (I really hope) will be available
 > for ARC in few weeks, but until that time we may not worry about Qt5 for
 > ARC - it won't be built.

 >  [2] Once ARC toolchain with NPTL is in Buildroot we'll need to cook
 > something similar to what we've done for Qt4 and I hope it will really
 > be that same simple. But probably for starters we'll disable Qt5 for
 > ARC.

Ok, ARC support patches for Qt5 are probably more likely to get accepted
upstream than Qt4 ones.

-- 
Bye, Peter Korsgaard
