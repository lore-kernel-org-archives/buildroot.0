From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Dec 2013 09:52:16 +0100
Subject: [Buildroot] [PATCH] alsa-utils: add dependency on host-pkgconf
In-Reply-To: <1386108607.6732.1.camel@bender.Speedport_W_724V_Typ_A_05011601_00_065>
 (Sven Neumann's message of "Tue, 03 Dec 2013 23:10:07 +0100")
References: <1386108607.6732.1.camel@bender.Speedport_W_724V_Typ_A_05011601_00_065>
Message-ID: <87mwkhm20v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:

 > The alsa-utils configure script will use pkg-config if available,
 > so make sure that it is available.

 > Signed-off-by: Sven Neumann <neumann@teufel.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
