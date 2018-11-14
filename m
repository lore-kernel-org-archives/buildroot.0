From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 10:36:36 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.62.0
In-Reply-To: <20181031084056.25144-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 31 Oct 2018 09:40:55 +0100")
References: <20181031084056.25144-1-peter@korsgaard.com>
Message-ID: <87muqcuhjv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-16839: SASL password overflow via integer overflow
 > https://curl.haxx.se/docs/CVE-2018-16839.html

 > CVE-2018-16840: use-after-free in handle close
 > https://curl.haxx.se/docs/CVE-2018-16840.html

 > CVE-2018-16842: warning message out-of-buffer read
 > https://curl.haxx.se/docs/CVE-2018-16842.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
