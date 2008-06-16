From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 16 Jun 2008 15:54:59 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot/toolchain/external-toolchain
In-Reply-To: <20080616122246.C821B3C987@busybox.net>
References: <20080616122246.C821B3C987@busybox.net>
Message-ID: <20080616135459.GA21225@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 16, 2008 at 05:22:46AM -0700, jacmet at uclibc.org wrote:
>Author: jacmet
>Date: 2008-06-16 05:22:45 -0700 (Mon, 16 Jun 2008)
>New Revision: 22378
>
>Log:
>toolchain: more sensible uclibc defaults for external toolchain

Note that the external toolchain always defaulted to use a glibc-based
toolchain. Steven should be notified on such a change since (IIRC) it
was him who added the external-toolchain thing..
