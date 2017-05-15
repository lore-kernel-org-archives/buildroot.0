From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:45:54 +0200
Subject: [Buildroot] [PATCH 2/3] bluez_utils: add missing check
	dependency for test program
In-Reply-To: <20170513171009.5219-2-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 13 May 2017 19:10:08 +0200")
References: <20170513171009.5219-1-romain.naour@gmail.com>
 <20170513171009.5219-2-romain.naour@gmail.com>
Message-ID: <87o9uuguf1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Tests are enabled since this has been introduced [1], so keep
 > them for now.

 > bluez_utils needs check tool and check if it's available [2].

 > [1] 06c3e2159686a886e52b2522a47e60c300cfb7f7
 > [2] https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/configure.ac?h=4.101#n51

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
