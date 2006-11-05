From: don <don_reid@comcast.net>
Date: Sat, 4 Nov 2006 16:10:20 -0800
Subject: [Buildroot] Naming of libraries.
In-Reply-To: <200611041848.41847.rob@landley.net>
References: <20061103081507.GA9631@zelow.no>
	<200611041848.41847.rob@landley.net>
Message-ID: <20061105001020.GA21979@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 04, 2006 at 06:48:41PM -0500, Rob Landley wrote:
> When you tell gcc "gcc -lcurses" it looks for libcurses in the library search 
> path.  Because gcc looks for things starting with "lib", people add that to 
> their library names to use gcc.  (Everybody agrees ".exe" is stupid for 
> executables, and libraries already have .a or .so anyway, but this is the FSF 
> we're talking about.  Making sense was never a strong suit with them.)

This convention was in Unix long before the FSF came along, don't blame
them.

Don Reid
