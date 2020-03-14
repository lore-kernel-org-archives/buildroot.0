From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:53:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgdiplus: backport of fix for
 GifQuantizeBuffer
In-Reply-To: <20200228091942.10490-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Fri, 28 Feb 2020 10:19:43 +0100")
References: <20200228091942.10490-1-heiko.thiery@gmail.com>
Message-ID: <878sk2u8kt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > In newer version of giflib the GifQuantizeBuffer code was removed.
 > libgdiplus included the needed function by their own:
 > (https://github.com/mono/libgdiplus/pull/575).

 > This patch will become obsolete once libgdiplus is bumped to version 6.x.

 > Fixes:
 > http://autobuild.buildroot.net/results/46c5cf068cf9ea50e53491870d9dbf3f134c8c22

 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
