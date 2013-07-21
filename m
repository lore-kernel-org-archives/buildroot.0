From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Jul 2013 00:12:12 +0200
Subject: [Buildroot] [PATCH] trivial: use geturischeme helper function
	where possible
In-Reply-To: <1b6f296fec701a154c75.1374236023@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Fri, 19 Jul 2013 14:13:43 +0200")
References: <1b6f296fec701a154c75.1374236023@BEANTN0L019720>
Message-ID: <87li4zr29v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> pkg-download.mk contains some helper functions to obtain
 Thomas> subparts of URLs, like the URI scheme. In pkg-generic.mk, there
 Thomas> is still one opportunity to use that helper function, instead
 Thomas> of hardcoding it.

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
