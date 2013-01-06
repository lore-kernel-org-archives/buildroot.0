From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 12:13:12 +0100
Subject: [Buildroot] [PATCH] Fix installation of crosstool-ng libraries
	to target
In-Reply-To: <1357449105-14780-1-git-send-email-bos@je-eigen-domein.nl>
 (Floris Bos's message of "Sun, 6 Jan 2013 06:11:45 +0100")
References: <1357449105-14780-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <87lic6h8dz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Floris" == Floris Bos <bos@je-eigen-domein.nl> writes:

 Floris> When using the crosstool-ng toolchain option, the libc
 Floris> libraries were not installed to target.  Buildroot calls the
 Floris> show-tuple function to determine the directory to copy from,
 Floris> and it seems that outputs the result to stderr instead of
 Floris> stdout

Committed, thanks.

-- 
Bye, Peter Korsgaard
