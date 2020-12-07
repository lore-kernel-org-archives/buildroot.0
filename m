From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Dec 2020 21:50:31 +0100
Subject: [Buildroot] [PATCH] package/musl: add upstream security fix for
 CVE-2020-28928
In-Reply-To: <20201120174632.28003-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 20 Nov 2020 18:46:32 +0100")
References: <20201120174632.28003-1-peter@korsgaard.com>
Message-ID: <87r1o1tk6g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The wcsnrtombs function has been found to have multiple bugs in handling of
 > destination buffer size when limiting the input character count, which can
 > lead to infinite loop with no forward progress (no overflow) or writing past
 > the end of the destination buffer.

 > For more details, see the advisory:
 > https://www.openwall.com/lists/oss-security/2020/11/20/4

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
