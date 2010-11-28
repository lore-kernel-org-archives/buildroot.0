From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 28 Nov 2010 17:13:57 -0500
Subject: [Buildroot] [git commit master 1/1] target-finalize:
	libtread_db: support nonstd toolchain setups
In-Reply-To: <20101128211439.EA7DC8D34B@busybox.osuosl.org>
References: <20101128211439.EA7DC8D34B@busybox.osuosl.org>
Message-ID: <201011281713.58894.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday, November 28, 2010 16:13:05 Peter Korsgaard wrote:
> Certain toolchain configs (E.G. on blackfin), don't use symlinks, so the
> file name to match is the actual SONAME (.so.*). Support these toolchains
> as well.

this is incorrect.  it really has nothing to do with the toolchain, nor is it 
non standard.  but i guess too late to fix this now.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101128/21cc297e/attachment.pgp>
