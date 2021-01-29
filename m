From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 10:00:17 +0100
Subject: [Buildroot] [PATCH-2020.02.x] package/glibc: security bump for
 additional post-2.30.x fixes
In-Reply-To: <20210128225255.15309-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 28 Jan 2021 23:52:54 +0100")
References: <20210128225255.15309-1-peter@korsgaard.com>
Message-ID: <878s8cw21q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2021-3326: Assertion failure in ISO-2022-JP-3 gconv module related to
 >   combining characters

 > For details, see https://sourceware.org/bugzilla/show_bug.cgi?id=27256 and
 > https://www.openwall.com/lists/oss-security/2021/01/27/3

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
