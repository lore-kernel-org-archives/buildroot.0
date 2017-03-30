From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:43:47 +0200
Subject: [Buildroot] [PATCH] graph-depends: rename pkgutil.py to
	brpkgutil.py
In-Reply-To: <20170321082233.14868-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Tue, 21 Mar 2017 09:22:33
 +0100")
References: <20170321082233.14868-1-yegorslists@googlemail.com>
Message-ID: <87r31ez8po.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > pkgutil.py is also part of Python itself. Placing pkgutil.py as is
 > in a folder with other scripts that require original pkgutil will
 > break them. This is the case with scanpypi. So rename pkgutil.py
 > to brpkgutil.py to avoid naming collision.

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=9766

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
