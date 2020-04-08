From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Apr 2020 16:22:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/swupdate: add optional systemd
 dependency
In-Reply-To: <20200330002649.36004-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sun, 29 Mar 2020 18:26:49 -0600")
References: <20200330002649.36004-1-james.hilliard1@gmail.com>
Message-ID: <87369ejbv4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Fixes:
 > core/notifier.c:27:10: fatal error: systemd/sd-daemon.h: No such file or directory
 >    27 | #include <systemd/sd-daemon.h>
 >       |          ^~~~~~~~~~~~~~~~~~~~~

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
