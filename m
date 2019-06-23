From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 23:32:05 +0200
Subject: [Buildroot] [PATCH 1/3] package/python: add upstream security
 fix for CVE-2019-9948
In-Reply-To: <20190616211712.824-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 16 Jun 2019 23:17:09 +0200")
References: <20190616211712.824-1-peter@korsgaard.com>
Message-ID: <87k1dc9eei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2019-9948: Unnecessary URL scheme exists to allow file:// reading
 > file in urllib.

 > https://bugs.python.org/issue35907

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
