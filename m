From: Martin Hicks <mort@bork.org>
Date: Tue, 8 Feb 2011 16:42:19 -0500
Subject: [Buildroot] [PATCH] V2: Add package bonnie++
In-Reply-To: <87sjvzvk85.fsf@macbook.be.48ers.dk>
References: <20110201220238.2c218fcd@surf>
	<1297096132-5433-1-git-send-email-mort@bork.org>
	<87sjvzvk85.fsf@macbook.be.48ers.dk>
Message-ID: <20110208214219.GA17440@darwin.bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, Feb 07, 2011 at 06:16:10PM +0100, Peter Korsgaard wrote:
> >>>>> "Martin" == Martin Hicks <mort@bork.org> writes:
> 
>  Martin> A good filesystem performance benchmark program.
>  Martin> Fixed up a few things requested by reviewers.
> 
> Bonnie++ is implemented in C++, right? If so, you need to depend on
> LIBSTDCPP (and add a comment statement if it isn't available) - See
> E.G. package/iperf/Config.in for an example.

Okay.  here's the updated patch:
