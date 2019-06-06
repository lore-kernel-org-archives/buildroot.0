From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 14:46:37 +0200
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version
 7.65.0
In-Reply-To: <20190522155004.30024-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 22 May 2019 17:50:04 +0200")
References: <20190522155004.30024-1-peter@korsgaard.com>
Message-ID: <87r286lw42.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2019-5435: Integer overflows in curl_url_set()
 >   https://curl.haxx.se/docs/CVE-2019-5435.html

 > - CVE-2019-5436: TFTP receive buffer overflow
 >   https://curl.haxx.se/docs/CVE-2019-5436.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
