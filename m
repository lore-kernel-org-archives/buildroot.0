From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 27 Dec 2010 16:01:45 -0500
Subject: [Buildroot] [PATCH] netperf: add Gentoo patch to fix buffer
	overflow compiler warnings
In-Reply-To: <87vd2flzaz.fsf@macbook.be.48ers.dk>
References: <855e95b6e3f2b8aba90318035d9951ac9d1a5cb3.1293384653.git.smiley73@users.sourceforge.net>
	<87vd2flzaz.fsf@macbook.be.48ers.dk>
Message-ID: <201012271601.46107.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 27, 2010 15:45:56 Peter Korsgaard wrote:
> >>>>> "heiko" == heiko  <heiko@zuerker.org> writes:
>  heiko> From: Heiko Zuerker <smiley73@users.sourceforge.net>
>  heiko> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
>  heiko> ---
>  heiko>  package/netperf/netperf-2.4.5-netserver.patch |   51
> +++++++++++++++++++++++++
> 
> So this just fixes a build warning, and otherwise doesn't affect the
> resulting binaries?

it fixes a possible buffer overflow and invalid memory indexing
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101227/2c65b816/attachment.pgp>
