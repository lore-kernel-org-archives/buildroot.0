From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Feb 2016 21:25:04 +0100
Subject: [Buildroot] [PATCH] sysklogd: override SKFLAGS with
	TARGET_CFLAGS
In-Reply-To: <1455967730-10332-1-git-send-email-romain.naour@gmail.com>
 (Romain Naour's message of "Sat, 20 Feb 2016 12:28:50 +0100")
References: <1455967730-10332-1-git-send-email-romain.naour@gmail.com>
Message-ID: <87bn7bf7tr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > TARGET_CFLAGS is not taken into account since SKFLAGS is used as CFLAGS.
 > We need to override SKFLAGS with TARGET_CFLAGS but keep -DSYSV which was
 > present in SKFLAGS.

 > Improve the previous fix introduced by
 > 8e3a5c13546451c0c6ceb8bc64e4397ceed14aca.

 > Fixes:
 > http://autobuild.buildroot.net/results/2fb/2fb94ecfdc32761a09da35e6fcbdd512847ec911

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
