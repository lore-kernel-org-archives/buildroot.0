From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Apr 2021 13:08:39 +0200
Subject: [Buildroot] [PATCH] package/xen: add upstream xsa-36{0, 4,
 8} security fixes
In-Reply-To: <20210405191753.11410-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 5 Apr 2021 21:17:53 +0200")
References: <20210405191753.11410-1-peter@korsgaard.com>
Message-ID: <87v98zfz60.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-3308: IRQ vector leak on x86
 >   https://xenbits.xenproject.org/xsa/advisory-360.html

 > - CVE-2021-26933: arm: The cache may not be cleaned for newly allocated
 >   scrubbed pages
 >   https://xenbits.xenproject.org/xsa/advisory-364.html

 > - CVE-2021-28687: HVM soft-reset crashes toolstack
 >   https://xenbits.xenproject.org/xsa/advisory-368.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
