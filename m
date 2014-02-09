From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Feb 2014 16:40:31 +0100
Subject: [Buildroot] [PATCH 1/1] trace-cmd: disable on avr32
In-Reply-To: <1391942815-18920-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sun, 9 Feb 2014 11:46:55 +0100")
References: <1391942815-18920-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <877g942t1s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > AVR32 does not have TLS support.
 > Fixes:
 > http://autobuild.buildroot.net/results/e24/e24af3ceb125da50f0f5cbffb0e3ca091c68af33/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
