From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 21:02:31 +0200
Subject: [Buildroot] [PATCH] avahi: Add systemd init script
In-Reply-To: <1399131345-11199-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sat, 3 May 2014 17:35:45 +0200")
References: <1399131345-11199-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87mweyofco.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > This consists of two files:
 >   - avahi-daemon.service:
 >     It start/stop the daemon avahi, it's a copy of the S50avahi-daemon
 >     script.
 >   - avahi_tmpfiles.conf:
 >     This one gets installed in /usr/lib/tmpfiles.d/ to be used by
 >     systemd-tmpfiles which will create the correct directory structure
 >     with the appropriate rights.
 >     This is the equivalent of the S05avahi-setup.sh script.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
