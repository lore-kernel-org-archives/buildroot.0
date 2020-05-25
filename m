From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 22:50:19 +0200
Subject: [Buildroot] [PATCH] package/wiringpi: remove
In-Reply-To: <20200524202651.20373-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 24 May 2020 22:26:51 +0200")
References: <20200524202651.20373-1-yann.morin.1998@free.fr>
Message-ID: <87d06rivsk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The author has completely ripped off the git tree, so the sources
 > are no longer available, with that message:
 >     "Please look for alternatives for wiringPi"

 > And indeed there is a better alternative, using the kernel GPIO
 > subsystem and drivers.

 > Note that queezelite looses that functionality now, but upstream
 > squeezelite has done changes to do without wiringpi (hint for an
 > upgrade?).

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Seiderer <ps.report@gmx.net>
 > Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

check-package complained about the line length of Config.in.legacy
entry. Committed after fixing that up, thanks.

-- 
Bye, Peter Korsgaard
