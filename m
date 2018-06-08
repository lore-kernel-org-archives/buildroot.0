From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jun 2018 16:33:15 +0200
Subject: [Buildroot] [PATCH] package/cryptodev-linux: bump to the latest
 version (f60aa0)
In-Reply-To: <20180608102307.15912-1-antoine.tenart@bootlin.com> (Antoine
 Tenart's message of "Fri, 8 Jun 2018 12:23:07 +0200")
References: <20180608102307.15912-1-antoine.tenart@bootlin.com>
Message-ID: <87in6tbb6c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Antoine" == Antoine Tenart <antoine.tenart@bootlin.com> writes:

 > Bumps the cryptodev-linux package to the latest version available, which
 > contains some fixes and allows to use cryptodev-linux with a recent
 > kernel (v4.17).

 > The patch bumps the version and update the locally calculated hash.

 > Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

Committed, thanks.

It would be good if you could also add a hash for the COPYING file.

-- 
Bye, Peter Korsgaard
