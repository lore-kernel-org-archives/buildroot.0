From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Nov 2017 10:30:10 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.57.0
In-Reply-To: <20171130000701.4648-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 30 Nov 2017 01:07:01 +0100")
References: <20171130000701.4648-1-peter@korsgaard.com>
Message-ID: <87bmjkktb1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2017-8816: NTLM buffer overflow via integer overflow
 > - CVE-2017-8817: FTP wildcard out of bounds read
 > - CVE-2017-8818: SSL out of buffer access

 > For more details, see the changelog:
 > https://curl.haxx.se/changes.html#7_57_0

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
