From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2009 08:59:11 +0100
Subject: [Buildroot] UDEV Card reader
In-Reply-To: <f5ba0ddf0911162243q27383293vef97ce31d0ca6e9d@mail.gmail.com>
References: <f5ba0ddf0910221738h66f41585s5c9236b24ac59829@mail.gmail.com>
	<4B01FF35.5080902@gmail.com>
	<f5ba0ddf0911162243q27383293vef97ce31d0ca6e9d@mail.gmail.com>
Message-ID: <20091117085911.447dc508@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 17 Nov 2009 14:43:44 +0800,
Pablo Trujillo <pabloctrujillov@gmail.com> a ?crit :

> for the record: if someone ask : why don't you use HAL any way?, the
> answer : because is too big and I just need some features, not the
> whole system.

Note that HAL is now deprecated, and the disk management part of HAL
has been moved to DeviceKit-disks.

See:
 http://hal.freedesktop.org/docs/DeviceKit-disks/
 http://lists.freedesktop.org/archives/hal/2008-May/011560.html
 http://lists.freedesktop.org/archives/devkit-devel/2009-April/000140.html
 https://wiki.ubuntu.com/Halsectomy

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
