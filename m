From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 09:33:41 +0200
Subject: [Buildroot] [PATCH] chrony: backport upstream patch to fix
 blocking on getrandom() at startup with recent kernels
In-Reply-To: <20180809155728.22817-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 9 Aug 2018 17:57:28 +0200")
References: <20180809155728.22817-1-peter@korsgaard.com>
Message-ID: <87in40md62.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > chrony calls getrandom() at startup if available, so it needs a workaround
 > for the blocking behaviour on recent (4.14.39+), similar to what was done
 > for util-linux in commit c4d86707cd6 (util-linux: add two upstream patches
 > to fix blocking on getrandom() with recent kernels).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
