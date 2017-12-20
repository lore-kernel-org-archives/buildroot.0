From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:52:56 +0100
Subject: [Buildroot] [PATCH] support/scripts/size-stats: avoid
 divide-by-zero
In-Reply-To: <20171128033707.15072-1-yurovsky@gmail.com> (Andrey Yurovsky's
 message of "Mon, 27 Nov 2017 19:37:07 -0800")
References: <20171127220849.5f62e6fc@windsurf.home>
 <20171128033707.15072-1-yurovsky@gmail.com>
Message-ID: <87shc5azpz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrey" == Andrey Yurovsky <yurovsky@gmail.com> writes:

 > Some packages (ex: skeleton-init-systemd) have a zero size so we cannot
 > divide by the package size. In that case make their percent zero
 > explicitly and avoid a ZeroDivisionError exception.

 > Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
