From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2011 08:56:28 +0200
Subject: [Buildroot] [PATCH 1/2] hostapd: fix build
In-Reply-To: <52492b5cb97af2b80f86cf2dee27c8a931d14856.1309759154.git.baruch@tkos.co.il>
References: <52492b5cb97af2b80f86cf2dee27c8a931d14856.1309759154.git.baruch@tkos.co.il>
Message-ID: <20110704085628.29549092@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon,  4 Jul 2011 09:00:29 +0300,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> The --sysroot option is required in CFLAGS and LDFLAGS to avoid
> compile time and link time failures.

This should no longer be needed, as Buildroot 2011.05 has added a
wrapper for external toolchains which avoids the need to pass an
explicit --sysroot option.

Can you point to a specific Buildroot configuration that exhibits the
problem ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
