From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 12 Feb 2009 14:29:45 +0100
Subject: [Buildroot] Easy Upgrade Path?
In-Reply-To: <49907BAE.3020509@ethertek.ca>
References: <49907BAE.3020509@ethertek.ca>
Message-ID: <20090212132945.GA30222@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 09, 2009 at 10:53:34AM -0800, Dan Pattison wrote:
> 
> Hello List:
> 
> I've been getting used to the buildroot development environment using 
> 2009.02-RC2 for ARM AT91SAM9g20-EK. I have made lots of changes and 
> additions that suit our project (config files, packages, etc.) We have 
> successfully compiled and included some of our own programs.
> 
> What is the recommended method to upgrade to the newest build 
> environment so we don't have to re-do everything? Is this possible?

Ulf introduced local/ when he started to commit and this was a good idea.

It got booted out some time later, by someone.

The point is that you can put your config files and non-included 
packages there and keep that out of the rest of the tree.

I like the idea and would like to put it back in.


Thomas.
