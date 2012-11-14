From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Nov 2012 23:02:39 +0100
Subject: [Buildroot] Fixes for RPC support
In-Reply-To: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 10 Nov 2012 22:42:37 +0100")
References: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87lie37shs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a set of fixes that should hopefully fix most RPC related
 Thomas> build failures. At least, I have now tested all packages that use RPC
 Thomas> support, and built all of them on:

 Thomas>  * uClibc with RPC support + libtirpc

 Thomas>  * uClibc without RPC support + libtirpc

 Thomas>  * glibc with RPC support + libtirpc

 Thomas>  * glibc without RPC support + libtirpc

 Thomas>  * uClibc without RPC without IPv6 + libtirpc

 Thomas> Some of the patches against libtirpc are really big, and I currently
 Thomas> am working with upstream to get a solution for these.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
