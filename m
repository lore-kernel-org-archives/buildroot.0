From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Mar 2019 15:03:21 +0100
Subject: [Buildroot] [PATCH-2019.02] package/nodejs: security bump to
 version 8.15.1
In-Reply-To: <20190325222139.5666-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 25 Mar 2019 23:21:39 +0100")
References: <20190325222139.5666-1-peter@korsgaard.com>
Message-ID: <87tvfpka1i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > Node.js: Slowloris HTTP Denial of Service with keep-alive (CVE-2019-5737)
 > OpenSSL: 0-byte record padding oracle (CVE-2019-1559)

 > For more details, see the CHANGELOG:
 > https://github.com/nodejs/node/blob/master/doc/changelogs/CHANGELOG_V8.md#8.15.1

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
