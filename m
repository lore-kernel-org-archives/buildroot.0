From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Mar 2018 11:54:31 +0100
Subject: [Buildroot] [PATCH 3/4] package/systemd: needs any UTF-8 locale
In-Reply-To: <c442605e0677f8b55af90f71c23a039e3d87c92b.1520159327.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 4 Mar 2018 11:29:05 +0100")
References: <cover.1520159327.git.yann.morin.1998@free.fr>
 <c442605e0677f8b55af90f71c23a039e3d87c92b.1520159327.git.yann.morin.1998@free.fr>
Message-ID: <87bmg49km0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Not all distributions have the language-agnostic C.UTF-8 locale (Gentoo,
 > I'm frowning at you!).

 > Instead, use any UTF-8 locale provided by the system.

 > Reported-by: Christian Stewart <kidovate@gmail.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Julius Kriukas <julius@kriukas.lt>
 > Cc: Christian Stewart <kidovate@gmail.com>
 > Cc: Trent Piepho <tpiepho@impinj.com>
 > Cc: Adam Duskett <aduskett@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
