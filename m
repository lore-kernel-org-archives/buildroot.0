From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 21:20:42 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/libgeos: fix comment
 dependencies (binutils-bug-12464, binutils-bug-27597)
In-Reply-To: <20210502144048.1212-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 2 May 2021 16:40:47 +0200")
References: <20210502144048.1212-1-ps.report@gmx.net>
Message-ID: <878s4dnp4l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The comment dependencies need to be the inverse of the package
 > dependencies (fixes comment shown in menuconfig even if the package
 > is available).

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
