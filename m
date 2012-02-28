From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2012 23:51:22 +0100
Subject: [Buildroot] buildroot ncurses build problem
In-Reply-To: <201202282248.14809.arnout@mind.be>
References: <CAAXf6LXn1Tdi9MLjqKEC1cGW+N4kU_YuiJD9xMVru1KVQNWcgA@mail.gmail.com>
 <749894859.1231630.1330441934340.JavaMail.root@zimbra22-e3.priv.proxad.net>
 <CAAXf6LX=31pR9AXMSvmBZOkJBvWMyrxD76_KptKXsECk+HV5Sg@mail.gmail.com>
 <201202282248.14809.arnout@mind.be>
Message-ID: <20120228235122.74f65eaa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Feb 2012 22:48:14 +0000,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  By the way, you do have /usr/bin/g++ installed I hope?

This is checked by toolchain/dependencies/dependencies.sh, and
Buildroot doesn't start the build if g++ is not found, so I guess
'snarf' (sic) has g++ installed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
