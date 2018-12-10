From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Mon, 10 Dec 2018 13:09:14 +0000
Subject: [Buildroot] [PATCH] gdb: Fix compilation for arc-2018.09 in
 some cases
In-Reply-To: <20181210121517.6ab76211@windsurf>
References: <20181210093526.29619-1-abrodkin@synopsys.com>
 <20181210114726.7df0a5fa@windsurf>
 <edb7c0f0a91fd30576c51df14f3b7f33a5c00460.camel@synopsys.com>
 <20181210120340.112055e6@windsurf>
 <bccaa89e46d7b185a8daa109545b656bbd7db049.camel@synopsys.com>
 <20181210121517.6ab76211@windsurf>
Message-ID: <cc13ed0ed94c1fa6b7462d9107d17a7c9c3f09df.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2018-12-10 at 12:15 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 10 Dec 2018 11:09:19 +0000, Alexey Brodkin wrote:
> 
> > > Under what exact situations is this build failure happening ?  
> > 
> > That's a good question.
> > As I wrote in my commit message it has to do with some specifics of toolchain headers
> > configuration. But I'm not really sure what triggers this.
> > 
> > I mean I spent quite some time looking at differences between very similar build trees
> > in one of which this issue happens but not in another but didn't get to any
> > conclusion.
> > 
> > And given there's an upstream fix for that issue I didn't want to invest more time into
> > this investigation, sorry.
> 
> Do you have a defconfig that fails to build ? Or is it related to the
> build machine environment ?

I have one setup where this problem happens.

If I rebuild everything from scratch with the same defconfig in the next folder
I cannot reproduce this issue - maybe because I made extra changes compared to
"problematic" defconfig.

-Alexey
