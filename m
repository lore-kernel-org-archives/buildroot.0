From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 10:46:21 +0200
Subject: [Buildroot] [PATCH] package/expat: security bump to version
 2.2.8
In-Reply-To: <20190915202142.13870-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 15 Sep 2019 22:21:42 +0200")
References: <20190915202142.13870-1-peter@korsgaard.com>
Message-ID: <87ftkj8mxu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 > CVE-2019-15903: In libexpat before 2.2.8, crafted XML input could fool the
 > parser into changing from DTD parsing to document parsing too early; a
 > consecutive call to XML_GetCurrentLineNumber (or XML_GetCurrentColumnNumber)
 > then resulted in a heap-based buffer over-read.

 > While we're at it, also change to use .tar.xz rather than the bigger
 > .tar.bz2.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
