From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Jul 2017 17:37:00 +0200
Subject: [Buildroot] [PATCH 1/2] configs/bananapro: bump Linux kernel to
	4.12.1
In-Reply-To: <20170712194432.21975-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 12 Jul 2017 21:44:31 +0200")
References: <20170712194432.21975-1-joerg.krause@embedded.rocks>
Message-ID: <87zic590f7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Drop the board specific patches which has been applied upstream.
 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed after also dropping the now unused BR2_GLOBAL_PATCH_DIR
setting, thanks.

-- 
Bye, Peter Korsgaard
