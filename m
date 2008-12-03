From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 3 Dec 2008 22:07:28 +0100
Subject: [Buildroot] [PATCH] allow module-init-tools on uClinux
In-Reply-To: <alpine.LFD.2.00.0812031545010.14328@xanadu.home>
References: <alpine.LFD.2.00.0812031545010.14328@xanadu.home>
Message-ID: <20081203210728.GE8563@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 03, 2008 at 03:47:47PM -0500, Nicolas Pitre wrote:
>Matching *-*-linux* is too restrictive.

yes, but
1) you would be better off to set BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y in
your toplevel .config, i.e. use the busybox module tools.
2) The current version is 3.5
3) Please fix this upstream, iff it is still required for 3.5
