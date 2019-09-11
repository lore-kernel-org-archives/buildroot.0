From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Sep 2019 14:20:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/libcurl: security bump to
 version 7.66.0
In-Reply-To: <20190911114036.5838-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 11 Sep 2019 13:40:34 +0200")
References: <20190911114036.5838-1-peter@korsgaard.com>
Message-ID: <877e6fuire.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > CVE-2019-5481: FTP-KRB double-free
 > https://curl.haxx.se/docs/CVE-2019-5481.html

 > CVE-2019-5482: TFTP small blocksize heap buffer overflow
 > https://curl.haxx.se/docs/CVE-2019-5482.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Ehh, this should naturally not have been part of the same series as the
kernel bump, please ignore.

-- 
Bye, Peter Korsgaard
