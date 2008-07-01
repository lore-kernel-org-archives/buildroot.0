From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jul 2008 20:41:12 +0200
Subject: [Buildroot] Ncurses install problem
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19092972E4@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Tue\,
	1 Jul 2008 13\:21\:56 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE19092972E4@mi8nycmail19.Mi8.com>
Message-ID: <874p79xx9z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> ln -sf /usr/share/terminfo
 hartleys> /home/bigguiness/buildroot/project_build_arm/ep9307/root/usr/lib/terminf
 hartleys> o ln: creating symbolic link
 hartleys> `/home/bigguiness/buildroot/project_build_arm/ep9307/root/usr/lib/termin
 hartleys> fo' to `/usr/share/terminfo': Permission deined

What is the permissions on $TARGET_DIR/usr/lib and
$TARGET_DIR/usr/lib/terminfo ?

-- 
Bye, Peter Korsgaard
