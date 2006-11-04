From: Rob Landley <rob@landley.net>
Date: Sat, 4 Nov 2006 18:48:41 -0500
Subject: [Buildroot] Naming of libraries.
In-Reply-To: <20061103081507.GA9631@zelow.no>
References: <20061103081507.GA9631@zelow.no>
Message-ID: <200611041848.41847.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 03 November 2006 3:15 am, Thomas Lundquist wrote:
> 
> I am making packages for qwt and gd and I ended up with pondering about
> what to call the package.
> 
> It does look like all libraries are prefixed with "lib" but most of them
> have lib prefixed in their name anyway.
> 
> Couldn't find anything in the docs either.
> 
> So, should all libraries be prefixed with "lib"?

When you tell gcc "gcc -lcurses" it looks for libcurses in the library search 
path.  Because gcc looks for things starting with "lib", people add that to 
their library names to use gcc.  (Everybody agrees ".exe" is stupid for 
executables, and libraries already have .a or .so anyway, but this is the FSF 
we're talking about.  Making sense was never a strong suit with them.)

(And yes, I honestly think they believe "-liberty" as a command line option is 
funny or something, hence libiberty.a)

Rob
-- 
"Perfection is reached, not when there is no longer anything to add, but
when there is no longer anything to take away." - Antoine de Saint-Exupery
