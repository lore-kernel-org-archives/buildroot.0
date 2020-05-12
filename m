From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 12:27:41 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/glibc: bump version for
 additional post-2.30 security fixes
In-Reply-To: <20200512085324.22685-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 12 May 2020 10:53:23 +0200")
References: <20200512085324.22685-1-peter@korsgaard.com>
Message-ID: <87ftc5morm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > CVE-2020-10029: Trigonometric functions on x86 targets suffered from stack
 >   corruption when they were passed a pseudo-zero argument.  Reported by Guido
 >   Vranken / ForAllSecure Mayhem.

 > CVE-2020-1751: A defect in the PowerPC backtrace function could cause an
 >   out-of-bounds write when executed in a signal frame context.

 > CVE-2020-1752: A use-after-free vulnerability in the glob function when
 >   expanding ~user has been fixed.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
