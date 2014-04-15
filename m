From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 22:59:41 +0200
Subject: [Buildroot] target ip address
In-Reply-To: <OF0873A4C2.49AE463D-ON85257CBB.0070C9D4-85257CBB.0070EAC6@LocalDomain>
References: <OF0873A4C2.49AE463D-ON85257CBB.0070C9D4-85257CBB.0070EAC6@LocalDomain>
Message-ID: <20140415225941.780f0efc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Naitik Amin,

On Tue, 15 Apr 2014 16:33:20 -0400, Naitik Amin wrote:

> Is there a menu option in menuconfig, where I can assign mac address and 
> ip address, that the target will come up with ?

No, there is not.

> I understand, I can always do this , from within the interfaces file, 
> under the skeleton.

Rather than changing the skeleton, you should use the root filesystem
overlay feature, which is more appropriate than duplicating the entire
skeleton just for changing one or two files.

See http://buildroot.org/downloads/manual/manual.html#rootfs-custom.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
