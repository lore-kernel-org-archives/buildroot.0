From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:30:27 +0200
Subject: [Buildroot] [PATCH] package/ruby: security bump to version 2.4.6
In-Reply-To: <20190416213340.14880-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 16 Apr 2019 23:33:40 +0200")
References: <20190416213340.14880-1-peter@korsgaard.com>
Message-ID: <87mukf6t98.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2019-8320: Delete directory using symlink when decompressing tar
 > - CVE-2019-8321: Escape sequence injection vulnerability in verbose
 > - CVE-2019-8322: Escape sequence injection vulnerability in gem owner
 > - CVE-2019-8323: Escape sequence injection vulnerability in API response handling
 > - CVE-2019-8324: Installing a malicious gem may lead to arbitrary code execution
 > - CVE-2019-8325: Escape sequence injection vulnerability in errors

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
