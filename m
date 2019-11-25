From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Nov 2019 15:15:09 +0100
Subject: [Buildroot] [PATCH] package/bind: security bump to version
 9.11.13
In-Reply-To: <20191124205917.20731-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 24 Nov 2019 21:59:17 +0100")
References: <20191124205917.20731-1-peter@korsgaard.com>
Message-ID: <87r21wrqj6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2019-6477: TCP-pipelined queries can bypass tcp-clients limit

 > For details, see the release notes:
 > https://downloads.isc.org/isc/bind9/9.11.13/RELEASE-NOTES-bind-9.11.13.html

 > (9.11.11..12 were not released)

 > Upstream moved to a 2019-2020 signing key, so update comment in hash file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
