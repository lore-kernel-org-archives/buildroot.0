From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 5 Nov 2006 09:27:26 +0100
Subject: [Buildroot] Naming of libraries.
In-Reply-To: <200611041848.41847.rob@landley.net>
References: <20061103081507.GA9631@zelow.no>
	<200611041848.41847.rob@landley.net>
Message-ID: <20061105082726.GA1158@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 04, 2006 at 06:48:41PM -0500, Rob Landley wrote:
> 
> When you tell gcc "gcc -lcurses" it looks for libcurses in the library search 
> path.  Because gcc looks for things starting with "lib", people add that to 
> their library names to use gcc.  (Everybody agrees ".exe" is stupid for 
> executables, and libraries already have .a or .so anyway, but this is the FSF 
> we're talking about.  Making sense was never a strong suit with them.)

hehe, ok.

the question was more of a naming convention issue in buildroot but I
guess it's just like that for other purposes.

(slang and ncurses are not prefixed with lib, so I guess it's no real
issue.)

> (And yes, I honestly think they believe "-liberty" as a command line option is 
> funny or something, hence libiberty.a)

but it is :=)


Thomas.
