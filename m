From: Daniel Mack <daniel@caiaq.de>
Date: Fri, 18 Dec 2009 09:10:58 +0800
Subject: [Buildroot] development environment
In-Reply-To: <87fx7946jc.fsf@macbook.be.48ers.dk>
References: <200912172131.19962.korgull@home.nl>
	<87fx7946jc.fsf@macbook.be.48ers.dk>
Message-ID: <20091218011058.GJ28375@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 17, 2009 at 10:47:19PM +0100, Peter Korsgaard wrote:
>  Marcel> I'm trying to create a workable environment to work with
>  Marcel> buildroot for the following :
> 
>  Marcel> I use a stable buildroot (which I may regularly upgrade) and
>  Marcel> will be adding kernel modules, board configurations and
>  Marcel> packages for my own design.  The documentation is very clear
>  Marcel> how to add the packages, so that's no issue.
> 
>  Marcel> The issue I have is that I want to use CVS for my own developed
>  Marcel> files and need to set up a workable environment to work
>  Marcel> efficiently to create patches for buildroot.
> 
> We're almost in 2010 - Are you really sure you want to do development
> with CVS today?
> 
> I've been using a similar setup like your with subversion and git
> without any big issues.

I'd also suggest using git for this purpose. Clone the master branch,
fork off your own development branch and add your packages there. You
can then keep your master in sync with the upstream repository and
rebase your own branch, merge the master or cherry-pick selected
commits.

We do something similar for own projects, and it works wonderfully.

And once you got used to git, you'll never want to get back to CVS,
believe me ;)

Daniel
