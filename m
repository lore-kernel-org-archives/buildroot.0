From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 12:24:31 +0200
Subject: [Buildroot] [PATCH-2020.02.x] package/glibc: security bump for
 additional post-2.30.x fixes
In-Reply-To: <20200829093654.6594-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 29 Aug 2020 11:36:54 +0200")
References: <20200829093654.6594-1-peter@korsgaard.com>
Message-ID: <87zh6diwbk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > arm: CVE-2020-6096: Fix multiarch memcpy for negative length [BZ #25620]
 > Unsigned branch instructions could be used for r2 to fix the wrong behavior
 > when a negative length is passed to memcpy.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
