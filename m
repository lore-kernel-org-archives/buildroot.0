From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Apr 2018 21:07:02 +0200
Subject: [Buildroot] [PATCH] patch: add upstream security fix
In-Reply-To: <653d97fd8ac542e3eac3c0a78dc701a7033ba39a.1523290836.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 9 Apr 2018 19:20:36 +0300")
References: <653d97fd8ac542e3eac3c0a78dc701a7033ba39a.1523290836.git.baruch@tkos.co.il>
Message-ID: <878t9w8ai1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-1000156: arbitrary command execution in ed-style patches.
 > Depend on MMU for now, because the patch adds a fork() call. Upstream
 > later switched to gnulib provided execute(), so this dependency can be
 > dropped on the next version bump.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
