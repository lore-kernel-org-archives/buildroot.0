From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jun 2011 00:14:29 +0200
Subject: [Buildroot] [PATCH 5/8] Mark some packages as not usable on
 non-MMU systems
In-Reply-To: <87r56y7rkm.fsf@macbook.be.48ers.dk>
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<35ff9eeb8007f6f1586eaead5e36c1d83a165178.1306792524.git.thomas.petazzoni@free-electrons.com>
	<87r56y7rkm.fsf@macbook.be.48ers.dk>
Message-ID: <20110613001429.5d89e4e3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Jun 2011 21:55:21 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Why exactly those? I would guess other packages have similar issues
> (bash for one)?

Because I tested those :-) Obviously, I didn't perform any sort of
exhaustive test, this patch was just the beginning of a long list of
packages not suitable for !MMU systems.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
