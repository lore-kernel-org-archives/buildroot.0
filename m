From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 21:26:57 +0200
Subject: [Buildroot] [PATCH] ghostscript: security bump to version 9.25
In-Reply-To: <20180927160023.24230-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 27 Sep 2018 18:00:23 +0200")
References: <20180927160023.24230-1-peter@korsgaard.com>
Message-ID: <87h8i02nzy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2018-16543: In Artifex Ghostscript before 9.24, gssetresolution and
 >   gsgetresolution allow attackers to have an unspecified impact

 > - CVE-2018-17183: Artifex Ghostscript before 9.25 allowed a user-writable
 >   error exception table, which could be used by remote attackers able to
 >   supply crafted PostScript to potentially overwrite or replace error
 >   handlers to inject code.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2918.05.x, 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
