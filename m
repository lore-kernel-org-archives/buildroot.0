From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 22:52:40 +0100
Subject: [Buildroot] [PATCH 2/3] toolchain-external: Fix ld.so naming
	with uClibc and EABIhf.
In-Reply-To: <1389687696-4824-2-git-send-email-stefan.sorensen@spectralink.com>
 ("Stefan =?utf-8?Q?S=C3=B8rensen=22's?= message of "Tue, 14 Jan 2014
 09:21:35 +0100")
References: <1389687696-4824-1-git-send-email-stefan.sorensen@spectralink.com>
 <1389687696-4824-2-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <87zjmwsyjb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan S?rensen <stefan.sorensen@spectralink.com> writes:

 > Currently ld-linux-armhf.so.* is added to external libs when
 > using an EABIhf toolchain, but this naming is not used by uClibc.
 > Fix by adding a check for glibc.

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
 > ---

Committed, thanks.

-- 
Bye, Peter Korsgaard
