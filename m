From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 27 Nov 2016 16:27:50 +0100
Subject: [Buildroot] [PATCH] m68k: add special gcc flag to avoid ICE for
 coldfire
In-Reply-To: <30093dc7-15f9-144b-77c3-e5f2236019a4@mind.be>
References: <20161126085144.GA23223@waldemar-brodkorb.de>
 <30093dc7-15f9-144b-77c3-e5f2236019a4@mind.be>
Message-ID: <20161127152750.GE14207@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

> On 26-11-16 09:51, Waldemar Brodkorb wrote:
> > Fixes:
> >   http://autobuild.buildroot.net/results/d47fa41aa860d82471b83ac90967d3a3dacd8611
> >   http://autobuild.buildroot.net/results/a21de4747f40a5ce93108c8979fbc0277d040e79
> 
>  Did you test whether exception handling still works?

Tested with attached C++ app.
Before and after the patches.
 
> > Requires this as prerequisite:
> > http://patchwork.ozlabs.org/patch/683830/
> > 
> > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> 
>  Not sure if this warrants a Sob from me, but OK.
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Will you provide the bigger patch Thomas wants to have?

best regards
 Waldemar
-------------- next part --------------
A non-text attachment was scrubbed...
Name: foo.cc
Type: text/x-c++src
Size: 2835 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161127/64501825/attachment.cc>
