From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:11:05 +0100
Subject: [Buildroot] [PATCH] package/haproxy: security bump to version
 2.0.10
In-Reply-To: <20191128144344.26356-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 28 Nov 2019 15:43:44 +0100")
References: <20191128144344.26356-1-peter@korsgaard.com>
Message-ID: <87v9r3caja.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2019-19330: The HTTP/2 implementation in HAProxy before 2.0.10
 >   mishandles headers, as demonstrated by carriage return (CR, ASCII 0xd),
 >   line feed (LF, ASCII 0xa), and the zero character (NUL, ASCII 0x0), aka
 >   Intermediary Encapsulation Attacks.

 > In addition, 2.0.6..10 fixes a number of bugs.  See the changelog for
 > details:

 > https://www.haproxy.org/download/2.0/src/CHANGELOG

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
