From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Sep 2011 11:14:51 +0200
Subject: [Buildroot] Fwd: Unable to mount root fs on unknown-block(0,0)
In-Reply-To: <4E6939CA.1020003@signaturealpha.com>
References: <4E69399D.7050209@videotron.ca>
 <4E6939CA.1020003@signaturealpha.com>
Message-ID: <20110909111451.09d4e0f0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 08 Sep 2011 17:55:22 -0400,
Marc Leclerc <marc-leclerc@signaturealpha.com> a ?crit :

> Hi just moved from 2010-11 to 2011-08 with kernel 3.0.2 and the boot 
> stops at the message in the subject. my fstab remains the same as
> much of the settings. anyone has a clue where i should start looking?

We have changed the default terminal on which getty is started. Make
sure to go in System configuration -> Port to run a getty on.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
