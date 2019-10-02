From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Oct 2019 08:10:12 +0200
Subject: [Buildroot] [PATCH] package/go: security bump to version 1.12.10
In-Reply-To: <20191001181927.30237-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 1 Oct 2019 20:19:26 +0200")
References: <20191001181927.30237-1-peter@korsgaard.com>
Message-ID: <87ftkby8xn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2019-16276: Go before 1.12.10 and 1.13.x before 1.13.1 allow HTTP
 >   Request Smuggling.
 >   https://github.com/golang/go/issues/34540

 > From the release notes:

 > go1.12.10 (released 2019/09/25) includes security fixes to the net/http and
 > net/textproto packages

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
