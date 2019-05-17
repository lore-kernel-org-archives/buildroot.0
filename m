From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 May 2019 10:36:53 +0200
Subject: [Buildroot] [PATCH] package/python: security bump to version
 2.7.16
In-Reply-To: <20190516141241.16065-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 16 May 2019 16:12:41 +0200")
References: <20190516141241.16065-1-peter@korsgaard.com>
Message-ID: <87tvdtxysa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2013-1752: Change use of readline() in :class:`imaplib.IMAP4_SSL` to limit line length

 > - CVE-2018-14647: The C accelerated _elementtree module now initializes hash
 >   randomization salt from _Py_HashSecret instead of libexpat's default
 >   CSPRNG.

 > For more details, see the NEWS file:
 > https://github.com/python/cpython/blob/v2.7.16/Misc/NEWS.d/2.7.16rc1.rst

 > Refresh patches, drop now upstream
 > package/python/0035-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch
 > and adjust hash of LICENSE file for a change of copyright years.

 > run-tests results:
 > 16:05:41 TestPython2                              Starting
 > 16:05:42 TestPython2                              Building
 > 16:11:26 TestPython2                              Building done
 > 16:11:32 TestPython2                              Cleaning up
 > .
 > ----------------------------------------------------------------------
 > Ran 1 test in 351.905s

 > OK

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
