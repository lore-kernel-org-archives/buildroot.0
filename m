From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 12:55:54 +0100
Subject: [Buildroot] [PATCH 2/4] package/webkitgtk: security bump to
 version 2.26.4
In-Reply-To: <20200215150929.13293-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 15 Feb 2020 16:09:26 +0100")
References: <20200215150929.13293-1-peter@korsgaard.com>
 <20200215150929.13293-2-peter@korsgaard.com>
Message-ID: <87y2t2hhkl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-3862: Impact: A malicious website may be able to cause a denial
 >   of service.  Description: A denial of service issue was addressed with
 >   improved memory handling.

 > - CVE-2020-3864: Impact: A DOM object context may not have had a unique
 >   security origin.  Description: A logic issue was addressed with improved
 >   validation.

 > - CVE-2020-3865: Impact: A top-level DOM object context may have incorrectly
 >   been considered secure.  Description: A logic issue was addressed with
 >   improved validation.

 > - CVE-2020-3867: Impact: Processing maliciously crafted web content may lead
 >   to universal cross site scripting.  Description: A logic issue was
 >   addressed with improved state management.

 > - CVE-2020-3868: Impact: Processing maliciously crafted web content may lead
 >   to arbitrary code execution.  Description: Multiple memory corruption
 >   issues were addressed with improved memory handling.

 > For more details, see the advisory:
 > https://webkitgtk.org/security/WSA-2020-0002.html

 > While we are at it, adjust the white space in the .hash function to match
 > the new agreements.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
