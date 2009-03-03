From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Mar 2009 09:34:20 +0100
Subject: [Buildroot] Xtensa BUILDROOT support
In-Reply-To: <49ACD317.6060205@hq.tensilica.com>
References: <49ACD317.6060205@hq.tensilica.com>
Message-ID: <20090303093420.77f7c3dd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 02 Mar 2009 22:49:59 -0800,
Maxim Grigoriev <maxim@tensilica.com> a ?crit :

>       Xtensa BUILDROOT uses a concept of source overlays,
>       which are necessary because Xtensa processors are
>       configurable and extensible. Xtensa tools, e.g.
>       gcc, gdb, and binutils, use source overlays, which
>       can not be substituted by the current BUILDROOT
>       patching mechanism. This update makes patch-kernel.sh
>       script capable of handling these overlays.

Can you detail how this concept of source overlays work, technically ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
