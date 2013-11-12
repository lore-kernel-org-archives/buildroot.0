From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Nov 2013 13:46:08 +0100
Subject: [Buildroot] [PATCH] qt5base: add missing hunk in
	posix_fallocate patch
In-Reply-To: <1384258626-30216-1-git-send-email-fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?= message of "Tue, 12 Nov 2013 14:17:06 +0200")
References: <1384258626-30216-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <87fvr14wkv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
> Sorry, I have just noticed a missing hunk. Without it, sqlite will not
> use posix_fallocate() even it is available.

Committed, thanks.

-- 
Bye, Peter Korsgaard
