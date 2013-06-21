From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jun 2013 14:48:55 +0200
Subject: [Buildroot] Build error when trying to build the py-smbus
 package of i2c-tools
In-Reply-To: <4E062DFADC6E8142AA8EE9D214BA0C50E403D5@NB-EX-MBX01.diasemi.com>
References: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
 <51C32CE0.9050902@mind.be>
 <4E062DFADC6E8142AA8EE9D214BA0C50E400ED@NB-EX-MBX01.diasemi.com>
 <51C421AF.20904@mind.be>
 <4E062DFADC6E8142AA8EE9D214BA0C50E401E5@NB-EX-MBX01.diasemi.com>
 <51C42F6D.7080701@mind.be>
 <4E062DFADC6E8142AA8EE9D214BA0C50E402D8@NB-EX-MBX01.diasemi.com>
 <4E062DFADC6E8142AA8EE9D214BA0C50E403D5@NB-EX-MBX01.diasemi.com>
Message-ID: <20130621144855.013f0222@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Weininger,

On Fri, 21 Jun 2013 12:37:33 +0000, Thomas Weininger wrote:

> So CC_FOR_BUILD and GCC_FOR_BUILD point to /usr/bin/gcc. Couldn't be that the source of the errors?
> But when this is wrong, why does the rest of i2c-tools build successfully?

CC_FOR_BUILD and GCC_FOR_BUILD are correct. As their name suggest,
those variables should point to the compiler that allows to build
things for the /build/ machine, i.e the native compiler.

	CC           => compiler to build things for the host machine
	CC_FOR_BUILD => compiler to build things for the build machine

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
