From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 2 Dec 2017 14:59:26 +0100
Subject: [Buildroot] [PATCH] libostree: disable manpages/documentation
 generation
In-Reply-To: <20171202144424.3f82a045@windsurf.lan>
References: <20171202075849.4439-1-marcus.folkesson@gmail.com>
 <20171202144424.3f82a045@windsurf.lan>
Message-ID: <20171202135906.GA31247@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Dec 02, 2017 at 02:44:24PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat,  2 Dec 2017 08:58:49 +0100, Marcus Folkesson wrote:
> > --enable-man is set to `auto` as default, which may break builds.
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  package/libostree/libostree.mk | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> Applied to master, thanks. I've added a reference to an autobuilder
> failure that should be fixed by this. It would be good if you could add
> such references yourself in the future when you submit a patch that
> fixes a build failures.

Absolutely, thank you.
I was not sure how long the log exists and the link is valid, so I omitted it from the commit message.

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Best regards
Marcus Folkesson
