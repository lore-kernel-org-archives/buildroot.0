From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 23:10:15 +0100
Subject: [Buildroot] [PATCH] ghostscript: security bump to version 9.26
In-Reply-To: <20181129155049.14068-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 29 Nov 2018 16:50:49 +0100")
References: <20181129155049.14068-1-peter@korsgaard.com>
Message-ID: <87ftve2reg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 >  - CVE-2018-17961: Artifex Ghostscript 9.25 and earlier allows attackers to
 >    bypass a sandbox protection mechanism via vectors involving errorhandler
 >    setup.  NOTE: this issue exists because of an incomplete fix for
 >    CVE-2018-17183.

 > - CVE-2018-18284: Artifex Ghostscript 9.25 and earlier allows attackers to
 >   bypass a sandbox protection mechanism via vectors involving the 1Policy
 >   operator.

 > - CVE-2018-19409: An issue was discovered in Artifex Ghostscript before
 >   9.26.  LockSafetyParams is not checked correctly if another device is
 >   used.

 > - CVE-2018-19475: psi/zdevice2.c in Artifex Ghostscript before 9.26 allows
 >   remote attackers to bypass intended access restrictions because available
 >   stack space is not checked when the device remains the same.

 > - CVE-2018-19476: psi/zicc.c in Artifex Ghostscript before 9.26 allows
 >   remote attackers to bypass intended access restrictions because of a
 >   setcolorspace type confusion.

 > - CVE-2018-19477: psi/zfjbig2.c in Artifex Ghostscript before 9.26 allows
 >   remote attackers to bypass intended access restrictions because of a
 >   JBIG2Decode type confusion.

 > For more details, see the release notes:
 > https://www.ghostscript.com/doc/9.26/History9.htm#Version9.26

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
