From: Dan Lyke <danlyke@flutterby.com>
Date: Sat, 24 Jan 2009 07:27:45 -0800
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <874ozpi078.fsf@macbook.be.48ers.dk>
References: <20090111213956.5713C76736@busybox.osuosl.org>
	<874ozpi078.fsf@macbook.be.48ers.dk>
Message-ID: <20090124072745.37588d9f@danhplaptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 24 Jan 2009 09:21:15 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:
> Why? Isn't 2009.01 working for you?

I can't speak for everyone, but I just (ie: this week) got patches from
Atmel, and they are still working off of 1.20. I'm hoping to ship this
product without revisiting that, and a quick attempt to look at forward
porting those patches to 2009.01 made it obvious that I'd have to
actually get in there and understanding the code.

Dan
