From: Thomas Lundquist <lists@zelow.no>
Date: Fri, 17 Aug 2007 13:22:26 +0200
Subject: [Buildroot] svn commit: trunk/buildroot: package/lzma
	target/linux toolchain/kern etc...
In-Reply-To: <20070816181741.AD51FA5E18@busybox.net>
References: <20070816181741.AD51FA5E18@busybox.net>
Message-ID: <20070817112226.GD29258@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 16, 2007 at 11:17:41AM -0700, ulf at uclibc.org wrote:
> 
> Log:
> Ensure lzma is built *before* linux, allow system installation in /usr/local/bin

I don't agree with this one. I want host tools put in
STAGING_DIR/bin or usr/bin, not outside the toolchain/buildroot.

It's alot cleaner and feels right.

And it's not given that the user are allowed to put the binary there
anyway.


Thomas.
