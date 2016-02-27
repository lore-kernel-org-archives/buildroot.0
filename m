From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 23:22:11 +0100
Subject: [Buildroot] [PATCH] package/pax-utils: needs kernel headers >=
	3.5
In-Reply-To: <1456602995-22546-1-git-send-email-romain.naour@gmail.com>
 (Romain Naour's message of "Sat, 27 Feb 2016 20:56:35 +0100")
References: <1456602995-22546-1-git-send-email-romain.naour@gmail.com>
Message-ID: <87io19rdyk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > pax-utils require a toolchain with kernel headers >= 3.5 to provide
 > PR_SET_NO_NEW_PRIVS.

 > Fixes:
 > http://autobuild.buildroot.net/results/a9e/a9e0287e67c03e5e385bf54578aa6c5c85206ec2

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
