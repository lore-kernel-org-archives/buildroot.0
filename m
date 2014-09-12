From: Maarten ter Huurne <maarten@treewalker.org>
Date: Fri, 12 Sep 2014 16:24:59 +0200
Subject: [Buildroot] [PATCH] openssh: Add patch to fix compilation with
	musl libc
In-Reply-To: <20140912093559.52c06209@free-electrons.com>
References: <1410493782-15542-1-git-send-email-maarten@treewalker.org>
 <20140912093559.52c06209@free-electrons.com>
Message-ID: <1687470.L4rVPvtCDV@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 12 September 2014 09:35:59 Thomas Petazzoni wrote:
> Dear Maarten ter Huurne,
> 
> On Fri, 12 Sep 2014 05:49:42 +0200, Maarten ter Huurne wrote:
> > The configure script finds the "howmany" macro, but some of the sources
> > using it do not include the required <sys/param.h> header.
> > 
> > Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> > ---
> > 
> >  .../openssh/openssh-02-fix-howmany-include.patch   | 66
> >  ++++++++++++++++++++++ 1 file changed, 66 insertions(+)
> >  create mode 100644 package/openssh/openssh-02-fix-howmany-include.patch
> 
> Thanks. Missing description and SoB line in the patch.

I'll add those and resubmit.

> Also, could you submit the patch upstream to OpenSSH ?

Already done :)
https://bugzilla.mindrot.org/show_bug.cgi?id=2274

Bye,
		Maarten
