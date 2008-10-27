From: Adam McLaurin <buildroot@irotas.net>
Date: Mon, 27 Oct 2008 11:55:16 -0400
Subject: [Buildroot] Unable to create files inside mounted root
	filesystem
In-Reply-To: <878wsakt8l.fsf@macbook.be.48ers.dk>
References: <1225112903.16248.1281448757@webmail.messagingengine.com>
	<873aiimau6.fsf@macbook.be.48ers.dk>
	<1225116460.30688.1281460263@webmail.messagingengine.com>
	<878wsakt8l.fsf@macbook.be.48ers.dk>
Message-ID: <1225122916.24422.1281482349@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Oct 2008 15:28:10 +0100, "Peter Korsgaard"
<jacmet@uclibc.org> said:
> True. Those options are forwarded directly to genext2fs (-b and -N
> options), so have a look at the man page of genext2fs for details.

Well the documentation doesn't even mention block size, but fortunately
the source code is more revealing:
#define BLOCKSIZE         1024

-Adam
