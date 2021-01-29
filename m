From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:32:40 +0100
Subject: [Buildroot] [PATCH] package/glibc: security bump for additional
 post-2.32.x fixes
In-Reply-To: <20210128213509.6056-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 28 Jan 2021 22:35:08 +0100")
References: <20210128213509.6056-1-peter@korsgaard.com>
Message-ID: <87bld8xhw7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2021-3326): Assertion failure in ISO-2022-JP-3 gconv module related to
 >   combining characters

 > For details, see https://sourceware.org/bugzilla/show_bug.cgi?id=27256 and
 > https://www.openwall.com/lists/oss-security/2021/01/27/3

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
