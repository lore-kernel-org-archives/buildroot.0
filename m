From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 08:41:45 +0200
Subject: [Buildroot] [PATCH] boot/barebox: needs host-{flex,bison}
In-Reply-To: <20190702201341.8230-1-m.niestroj@grinn-global.com> (Marcin
 Niestroj's message of "Tue, 2 Jul 2019 22:13:41 +0200")
References: <20190702201341.8230-1-m.niestroj@grinn-global.com>
Message-ID: <87wogubb2u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

 > Barebox starting from 2019.02 no longer ships flex/bison generated
 > parser. Add conditional kconfig dependencies, same as we did for kernel
 > and uboot.

 > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
