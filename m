From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2012 21:10:27 +0100
Subject: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
In-Reply-To: <201202241110.06277.minimod@morethan.org>
References: <63D6870D443E63419AC4A0C97B86C092030FCA15@MBXCLUSTER.mdh.local>
 <CAGm1_kuoq9uoEPVDUftFeUS9xfrtri_GTf-r9R0fuoZ1=woH3Q@mail.gmail.com>
 <63D6870D443E63419AC4A0C97B86C092030FCA25@MBXCLUSTER.mdh.local>
 <201202241110.06277.minimod@morethan.org>
Message-ID: <20120224211027.51454463@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 24 Feb 2012 11:10:04 -0600,
"Michael S. Zick" <minimod@morethan.org> a ?crit :

> A better solution -
> Put your device to sleep (suspend to ram).
> It can __resume__ in less than 1 sec.
> It only needs to __re-boot__ after loss of battery power (rare).

While this is a great solution, it may not apply to the automotive
industry: you may want to reduce the power consumption of the device
down to 0, so that the car battery doesn't empty itself if the car is
unused during a long period of time. I guess in terms of boot time
there is no one-size-fits-all solution, the solution very much depends
on the environment and constraints (hardware, allowed power
consumption, etc.).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
