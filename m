From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Dec 2013 08:51:24 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #4 (deadline
	January 5)
In-Reply-To: <CAAXf6LWFAfs_i_NjBbD3RZ=Y0RDKftzwj-_8xKuqyYA=69PNsw@mail.gmail.com>
References: <CAAXf6LWFAfs_i_NjBbD3RZ=Y0RDKftzwj-_8xKuqyYA=69PNsw@mail.gmail.com>
Message-ID: <20131223085124.3e9882f0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 22 Dec 2013 21:46:32 +0100, Thomas De Schampheleire wrote:

> perl: fix build
> Francois Perrad <fperrad@gmail.com>
> http://patchwork.ozlabs.org/patch/198013

Let's see what Fran?ois says about this one.

> [1/2] dbus: bump dbus version from 1.4.24 to current 1.6.8
> Gary Coulbourne <bear@bears.org>
> http://patchwork.ozlabs.org/patch/207507

This is still needed: our DBus version is old.

> [2/2] dbus: fix permissions of the installed launch helper
> Gary Coulbourne <bear@bears.org>
> http://patchwork.ozlabs.org/patch/207508

We can mark this one as superseded: Peter fixed it in
aab3a0ba792f33aae66757f0e5c3fc67e41104ec.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
