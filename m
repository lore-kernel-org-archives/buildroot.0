From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Dec 2016 21:38:53 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: disallow 4.8.x for ARMv8 cores
In-Reply-To: <20161206163618.1758-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 6 Dec 2016 17:36:17 +0100")
References: <20161206163618.1758-1-peter@korsgaard.com>
Message-ID: <87vauwiyhu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Notice: A53/A57 were in fact supported in aarch64 mode in 4.8 (in aarch32
 > mode only from 4.9), but it doesn't handle --with-abi, and as there is
 > unlikely to be any aarch64 based legacy projects unwilling to use a newer
 > GCC version it is simpler to disallow it for all modes.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
