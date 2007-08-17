From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 17 Aug 2007 15:48:44 +0200
Subject: [Buildroot] svn commit: trunk/buildroot: package/lzma
	target/linux toolchain/kern etc...
In-Reply-To: <20070817112226.GD29258@zelow.no>
References: <20070816181741.AD51FA5E18@busybox.net>
	<20070817112226.GD29258@zelow.no>
Message-ID: <9930fb0a0708170648v5689bc5j9a2a5957b424bf0d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/08/07, Thomas Lundquist <lists@zelow.no> wrote:
> On Thu, Aug 16, 2007 at 11:17:41AM -0700, ulf at uclibc.org wrote:
> >
> > Log:
> > Ensure lzma is built *before* linux, allow system installation in /usr/local/bin
>
> I don't agree with this one. I want host tools put in
> STAGING_DIR/bin or usr/bin, not outside the toolchain/buildroot.
>
> It's alot cleaner and feels right.
>
> And it's not given that the user are allowed to put the binary there
> anyway.

Seconded. The correct place is the same as for the host-sed et al.
