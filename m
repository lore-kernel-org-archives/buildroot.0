From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Fri, 14 Feb 2014 10:23:00 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140214101241.27857b9e@skate>
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356C692F6@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> 
> >        arc |            imagemagick-6.8.8-4 | NOK |
> http://autobuild.buildroot.net/results/97ec0c366c24bd03fe4c26851e8729a4d
> 8eaf4d0/
> 
> Internal compiler error. Anton, would you mind checking if your recent
> bump of the ARC toolchain components solves this compiler problem?

No, that hasn't fixed yet. I've opened bug report for this error, but no ETA. Should I disable affected packages for ARC until solution will be ready?

> >        arc |                  libxml2-2.9.1 | NOK |
> http://autobuild.buildroot.net/results/4abdea83c6915aa02b6dc55c9a9dd964
> ba70ac4b/
> 
> Another internal compiler error. Anton, same thing, is that fixed by your
> recent bump?

Yes, it passes for me with the "next" branch.

Anton
