From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2010 11:39:20 +0100
Subject: [Buildroot] Persistent U-Boot environment variables under QEMU
In-Reply-To: <727912.43003.qm@web44816.mail.sp1.yahoo.com>
References: <727912.43003.qm@web44816.mail.sp1.yahoo.com>
Message-ID: <20100214113920.153e393f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,o

On Sat, 13 Feb 2010 13:51:26 -0800 (PST)
Jim Thomas <jimthomasembedded@yahoo.com> wrote:

> With real hardware, the U-Boot environment variables are persistent
> in flash memory.
> 
> Is there a way to simulate this with QEMU?  I would not go to the
> trouble to manually enter the U-Boot environment variables each time
> I boot under QEMU, but if there is a persistence mechanism available
> then including U-Boot might be practical.

Qemu can emulate flash memory, so U-Boot can be used "normally". In
2008, I managed to get U-Boot working on the versatilepb board
emulation of Qemu, with few changes to Qemu and U-Boot. See
http://thomas.enix.org/Blog-20081002153859-Technologie for details. The
three first patches have been merged into Qemu since then, but the last
(and most important) patch was never merged.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
