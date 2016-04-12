From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Apr 2016 23:22:19 +0200
Subject: [Buildroot] [PATCH] links: fix static link with directfb
In-Reply-To: <535156e43ad4326bc4f9eff213ad4903229c01b5.1460480136.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 Apr 2016 19:55:36 +0300")
References: <535156e43ad4326bc4f9eff213ad4903229c01b5.1460480136.git.baruch@tkos.co.il>
Message-ID: <87mvoyldys.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The AC_HAVE_FUNCS autoconf macro uses gcc to check for function existence.
 > This breaks when the library depends on libstdc++, like directfb. Add this
 > dependency externally.

 > Fixes:
 > http://autobuild.buildroot.net/results/548/548019b71c7db649f20d2c479bb8fb3612162d4a/
 > http://autobuild.buildroot.net/results/c94/c9495f54db388bde9d64325bb57fc4e58741f7a7/
 > http://autobuild.buildroot.net/results/9b8/9b883d42bff3633f16447d76d2eb4ddf68013788/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
