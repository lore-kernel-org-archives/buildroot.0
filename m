From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Apr 2012 19:47:27 +0200
Subject: [Buildroot] [PATCH] Fix makedevs to allow longer path names
In-Reply-To: <1333881171-3707-1-git-send-email-git@jlunz.de> (Julian Lunz's
 message of "Sun, 8 Apr 2012 12:32:51 +0200")
References: <1333881171-3707-1-git-send-email-git@jlunz.de>
Message-ID: <87d37it8sw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julian" == Julian Lunz <git@jlunz.de> writes:

 Julian> Makedevs path name is currently limited to 40, changed it to
 Julian> PATH_MAX 4096 from linux/include/linux/limits.h
 Julian> Signed-off-by: Julian Lunz <git@jlunz.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
