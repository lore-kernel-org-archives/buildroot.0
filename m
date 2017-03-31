From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:00:59 +0200
Subject: [Buildroot] [PATCH] busybox: fix mdev.conf
In-Reply-To: <20170324075321.12384-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Fri, 24 Mar 2017 08:53:21 +0100")
References: <20170324075321.12384-1-joerg.krause@embedded.rocks>
Message-ID: <87shlux74k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > mdev does not set "/dev/snd" and "/dev/input" group and permission
 > propery, because with commit c3cf1e30a3022453311a7e9fe11d94c7a381640e
 > (May 2013!) the behavior of mdev has changed.

 > The device name is now taken directly from the uevent file and does no
 > longer match the old rule.

 > Fix the rules for "/dev/snd" and "/dev/input" according to the example
 > given in [1].

 > [1] http://lists.busybox.net/pipermail/busybox/2015-February/082297.html

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
