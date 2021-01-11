From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2021 20:18:30 +0100
Subject: [Buildroot] [PATCH v3 1/1] {linux, linux-headers}: bump 5.{4,
 10}.x 4.{4, 9, 14, 19} series
In-Reply-To: <20210111175520.839692-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Mon, 11 Jan 2021 18:55:20 +0100")
References: <20210111175520.839692-1-petr.vorel@gmail.com>
Message-ID: <87k0sjnuyh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Drop 5.9 stable (EOL).
 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 > ---
 > Changes v2->v3:
 > * new releases for all supported versions
 > * fix hash for 5.10 (I used .gz by accident, now use .xz)

 > NOTE: all these versions contain MUSL toolchain fix a85cbe6159ff ("uapi:
 > move constants from <linux/kernel.h> to <linux/const.h>").

You forgot to add Config.in.legacy handling for the 5.9
headers. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
