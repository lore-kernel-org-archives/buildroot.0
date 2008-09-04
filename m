From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 4 Sep 2008 12:09:40 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/fltk
In-Reply-To: <87vdxlu3zi.fsf@macbook.be.48ers.dk>
References: <20080827201919.E9B3DF8006@busybox.net>
	<20080828002656.GB10828@cloud.net.au>
	<87vdxlu3zi.fsf@macbook.be.48ers.dk>
Message-ID: <20080904020940.GA17987@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 28, 2008 at 07:02:09AM +0200, Peter Korsgaard wrote:
>  Hamish> I think those comments are kind of helpful. Otherwise, if you know a
>  Hamish> package exists but can't find it in menuconfig, you need to open up
>  Hamish> Config.in to find the dependencies.
> 
> Sometimes they are, but having tons of those lines listed for all X
> programs when you haven't selected X is imho not.

That's fair.

> We should probably move X applications / libraries to it's own sub
> menu.

Good solution, then all the X applications could be disabled and
replaced with a single comment if X libraries are not enabled.

>  Hamish> Alternatively the package could use select instead of depends.
> 
> Yeah, but that wouldn't work here as there's multiple providers of X
> (and anyway, including a monster like X behind your back isn't really
> userfriendly either).

Very true!

thanks
Hamish

-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
