From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:36:09 +0200
Subject: [Buildroot] [PATCH] package/libnss: security bump to version
 3.42.1
In-Reply-To: <CACXmViYvjeLaZzGKaCkMRGaXJ9crGubZ=1QJTyQugKiykkw2og@mail.gmail.com>
 (Peter Korsgaard's message of "Fri, 31 May 2019 10:04:36 +0200")
References: <20190530230741.14323-1-peter@korsgaard.com>
 <CACXmViYvjeLaZzGKaCkMRGaXJ9crGubZ=1QJTyQugKiykkw2og@mail.gmail.com>
Message-ID: <87muiug1zq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > On Fri, May 31, 2019 at 1:07 AM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> Fixes the following security issues:
 >> 
 >> (3.41) CVE-2018-12404: Cache side-channel variant of the Bleichenbacher
 >> attack
 >> 
 >> (3.42.1) CVE-2018-18508: Add additional null checks to several CMS functions
 >> to fix a rare CMS crash.  Thanks to Hanno B?ck and Damian Poddebniak for the
 >> discovery and fixes
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
