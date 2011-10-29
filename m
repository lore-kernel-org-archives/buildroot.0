From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2011 08:20:24 +0200
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <4ff558d1b2a462f239c4c83ef48b6680@zacarias.com.ar>
References: <20111024173815.2277c6dd@skate> <4EA801B8.7000502@visionsystems.de>
 <4ff558d1b2a462f239c4c83ef48b6680@zacarias.com.ar>
Message-ID: <20111029082024.61d9042b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 26 Oct 2011 10:05:55 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> My $.02 is that we could just do it as a package with a huge option 
> list for each firmware file(s) required for different drivers/devices.
> I'd go for a smaller subset to begin with since there are firmware 
> files for SAN controllers and other big iron stuff that probably
> are't the target for buildroot.

Or you put a single "string" option in which the user can pass a
space-separated list of firmware to install.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
