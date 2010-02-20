From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 20:07:35 +0100
Subject: [Buildroot] Multiple architectures best practices?
In-Reply-To: <BLU148-W126CE5F8A30A9DD8A9BAA5EB7A0@phx.gbl>
References: <BLU148-W126CE5F8A30A9DD8A9BAA5EB7A0@phx.gbl>
Message-ID: <20100220200735.495486b5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Terry,

On Tue, 29 Dec 2009 14:44:51 -0500
Terry Forrest <zippybot7@hotmail.com> wrote:

> Hi All - new to buildroot and am impressed!  Nice design
> and implementation.

Thanks!

> We would like to use BR to build for two architectures from
> the same tree.  We can use a local x86 for a "simulation" mode,
> and the target is arm.  I see that this is cleanly supported in the
> 2009.11 release.
> 
> My question is on a "best practice" for this.  I've set up 
> a top-level Makefile that goes something like this:

> This seems to work okay - any comments or warnings?
> Again, I'm new to BR and want to make sure I'm not 
> gonna step in anything.

Your Makefile looks good to me.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
