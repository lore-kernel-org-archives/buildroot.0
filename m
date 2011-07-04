From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Jul 2011 21:55:14 +0200
Subject: [Buildroot] tail -f /var/log/messages in inittab
In-Reply-To: <4E0CA8F9.7080706@lucaceresoli.net> (Luca Ceresoli's message of
 "Thu, 30 Jun 2011 18:48:57 +0200")
References: <4E0CA8F9.7080706@lucaceresoli.net>
Message-ID: <874o31253x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Hi,
 Luca> I've been staring at the following line in fs/skeleton/etc/inittab:

 >> tty3::respawn:/usr/bin/tail -f /var/log/messages

 Luca> and wondered if it's useful to anybody.
 Luca> I guess in many embedded systems it is a useless waste of resources.
 Luca> At least it is on mine, so I wiped it in my port.

Sorry, I missed your mail, but it was pointed out to me on IRC as well,
so I removed it.

-- 
Bye, Peter Korsgaard
