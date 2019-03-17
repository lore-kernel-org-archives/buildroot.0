From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Mar 2019 17:55:48 +0100
Subject: [Buildroot] [PATCH] package/runc: blacklist Codesourcery ARM
 toolchain
In-Reply-To: <20190303203845.30335-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 3 Mar 2019 21:38:45 +0100")
References: <20190303203845.30335-1-peter@korsgaard.com>
Message-ID: <8736nla19n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/018e309caa0fc662aa2993e47b2037fb6c569011/

 > This toolchain uses glibc 2.18, which does not provide O_TMPFILE support.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
