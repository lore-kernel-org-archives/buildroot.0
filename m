From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 10:59:31 +0200
Subject: [Buildroot] [PATCH] libunistring: bump to version 0.9.9
In-Reply-To: <f4e7a79ad539740d5d57f80b7ee87a527f621c25.1522396634.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 30 Mar 2018 10:57:14 +0300")
References: <f4e7a79ad539740d5d57f80b7ee87a527f621c25.1522396634.git.baruch@tkos.co.il>
Message-ID: <87fu4i6irw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop --{enable,disable}-threads; threading support is detected
 > automatically.

 > Add GPLv3 license file.

 >  LIBUNISTRING_LICENSE = LGPL-3.0+ or GPL-2.0

I get it that LGPL-3.0 refers to the GPL-3.0 license, but it is a bit
odd that upstream doesn't ship a GPL-2.0 license file.

Oh well, committed - Thanks.

-- 
Bye, Peter Korsgaard
