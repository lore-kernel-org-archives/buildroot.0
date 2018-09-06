From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Sep 2018 09:35:26 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.61.1
In-Reply-To: <20180905214049.31790-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 5 Sep 2018 23:40:49 +0200")
References: <20180905214049.31790-1-peter@korsgaard.com>
Message-ID: <871sa7axj5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2018-14618: NTLM password overflow via integer overflow
 > For more details, see the advisory:
 > https://curl.haxx.se/docs/CVE-2018-14618.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
