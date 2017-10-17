From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:05:26 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.56.0
In-Reply-To: <20171004073517.7164-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 4 Oct 2017 09:35:17 +0200")
References: <20171004073517.7164-1-peter@korsgaard.com>
Message-ID: <87efq2jga1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Drop upstreamed patch.
 > Fixes CVE-2017-1000254 - FTP PWD response parser out of bounds read:

 > https://curl.haxx.se/docs/adv_20171004.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
