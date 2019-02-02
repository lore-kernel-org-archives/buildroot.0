From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Feb 2019 14:27:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/python: add upstream security
 fix for CVE-2019-5010
In-Reply-To: <20190201123625.7287-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 1 Feb 2019 13:36:23 +0100")
References: <20190201123625.7287-1-peter@korsgaard.com>
Message-ID: <87d0oaz5f6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2019-5010: NULL pointer dereference using a specially crafted X509
 > certificate

 > https://bugs.python.org/issue35746

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
