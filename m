From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2015 22:45:32 +0200
Subject: [Buildroot] [PATCH] package/efl/expedite: x-includes and
	x-libraries must be set for cross-compiling
In-Reply-To: <1430949044-27976-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Wed, 6 May 2015 23:50:44 +0200")
References: <1430949044-27976-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87wq0kktg3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > If those flags are not explicitly passed, the libecore configure
 > script will include -I/usr/X11R6/include and -L/usr/X11R6/lib in the
 > compile flags, which are obviously unsafe for cross-compilation.

 > The fix is similar to 0d9d8984a9240a27f5ed2e15f1977ada67266906 and
 > da50b6b61c4a566fd28888f5a3a6dcb06fe1b495.

 > Fixes:
 > http://autobuild.buildroot.org/results/24b/24b578a28455409b7bcc0277abc6b478c51ae67f

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
