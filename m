From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 21:56:38 +0200
Subject: [Buildroot] [PATCH-2019.02] package/go: security bump to
 version 1.11.6
In-Reply-To: <20190405090340.4678-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 5 Apr 2019 11:03:40 +0200")
References: <20190405090340.4678-1-peter@korsgaard.com>
Message-ID: <87bm1kp6o9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 > CVE-2019-9741: An issue was discovered in net/http in Go 1.11.5.  CRLF
 > injection is possible if the attacker controls a url parameter, as
 > demonstrated by the second argument to http.NewRequest with \r\n followed by
 > an HTTP header or a Redis command.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
