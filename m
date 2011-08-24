From: Robin Holt <holt@sgi.com>
Date: Wed, 24 Aug 2011 11:21:56 -0500
Subject: [Buildroot] License for patches
In-Reply-To: <201108241205.23310.vapier@gentoo.org>
References: <4E5517E0.30003@finalbit.de> <201108241205.23310.vapier@gentoo.org>
Message-ID: <20110824162156.GF4926@sgi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 24, 2011 at 12:05:22PM -0400, Mike Frysinger wrote:
> On Wednesday, August 24, 2011 11:25:20 Lars Reemts wrote:
> > Which license is relevant for the package specific patches distributed
> > by buildroot? Formally it must be the GPL.
> 
> says who ?  i dont see the logic here.

Let me preface with, I am neither a lawyer nor a judge and until there
is established precedence in your juristiction, there is no final answer,
but...

Our company lawyers gave us a different read many years ago.  The
modifications to a source base which become part of a final executable
bit of code or machine readable blob (specifically, they were addressing
C# and java code here) must be compatible with the license for the
body of the work into which they were included and, in that use,
are licensed under either that license or a less restrictive license,
as the author/owner sees fit.  The size of changes with respect to the
"operating" part of the code was important in that reading as something
which significantly modifies the "operating" part of the code has more
ability to amend the license terms, whereas a minor patch really does
not carry enough weight to amend a license at all.

With that interpretation, the patch's license, despite being distributed
with the buildroot "tool" would probably follow the license of the
package it is changing and the two together would be considered the
derivative work.  buildroot is merely the tool which allows you to put the
patch together with the source and would not factor into the discussion
beyond that.

Good Luck,
Robin Holt
