From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Feb 2019 20:50:44 +0100
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version
 7.64.0
In-Reply-To: <20190206165436.8652-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 6 Feb 2019 17:54:35 +0100")
References: <20190206165436.8652-1-peter@korsgaard.com>
Message-ID: <87a7irv9pn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-16890: NTLM type-2 out-of-bounds buffer read
 > https://curl.haxx.se/docs/CVE-2018-16890.html

 > CVE-2019-3822: NTLMv2 type-3 header stack buffer overflow
 > https://curl.haxx.se/docs/CVE-2019-3822.html

 > CVE-2019-3823: SMTP end-of-response out-of-bounds read
 > https://curl.haxx.se/docs/CVE-2019-3823.html

 > The copyright year changed in the COPYING file, so update the hash.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
