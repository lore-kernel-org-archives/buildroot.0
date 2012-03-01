From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 08:32:59 +0100
Subject: [Buildroot] [PATCH 1/2] openssl: Fix build on ARM with GCC 4.6.x
In-Reply-To: <20120301053726.GA4978@sapphire.tkos.co.il>
References: <1330558078-3978-1-git-send-email-ismael.luceno@gmail.com>
 <20120301053726.GA4978@sapphire.tkos.co.il>
Message-ID: <20120301083259.65be299c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 1 Mar 2012 07:37:27 +0200,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> Will this work for external and ct-ng toolchains?

No. For the external and ct-ng toolchains, we have no way of testing
the gcc version through BR2_* variables, we could only do it by running
the cross gcc itself and checking its version number.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
