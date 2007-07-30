From: Thomas Lundquist <lists@zelow.no>
Date: Mon, 30 Jul 2007 20:54:16 +0200
Subject: [Buildroot] Qtopia4 fails building - target stage tries to run
	target binaries	on build machine
In-Reply-To: <1185796725.27015.7.camel@localhost.localdomain>
References: <1185796725.27015.7.camel@localhost.localdomain>
Message-ID: <20070730185416.GA23362@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2007 at 01:58:45PM +0200, Hans-Christian Egtvedt wrote:
> 
> I am trying to look into how to "fix" Qtopia 4 in Buildroot, at least it
> does not compile for me (snapshot 20070717).

what happens? 

> The makefile seems to generate target specific binaries in build_<arch>
> directory, and host specific binaries in toolchain_build_<arch>.

which is the right thing to do.

> As I understand the toolchain_build_<arch> binaries should be installed
> to $(STAGING_DIR) and the build_<arch> binaries should be installed to
> $(TARGET_ROOT)?

But what is the problem? 




Thomas.
