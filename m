From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Mar 2018 11:43:16 +0100
Subject: [Buildroot] [PATCH] package/systemd: create groups required for
 udevd
In-Reply-To: <20180303165556.25630-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 3 Mar 2018 17:55:56 +0100")
References: <20180303165556.25630-1-yann.morin.1998@free.fr>
Message-ID: <87o9k49l4r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > udevd needs extra groups for its bundled rules:
 >     Mar 03 12:21:30 buildroot systemd-udevd[732]: Specified group 'render' unknown
 >     Mar 03 12:21:30 buildroot systemd-udevd[732]: Specified group 'kvm' unknown

 > Add those missing groups.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Julius Kriukas <julius@kriukas.lt>
 > Cc: Trent Piepho <tpiepho@impinj.com>
 > Cc: Adam Duskett <aduskett@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
