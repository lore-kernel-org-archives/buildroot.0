From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 15:17:17 +0200
Subject: [Buildroot] Suggestion: increase username buffer size in
 busybox login
In-Reply-To: <CADiAo4LX4q5Vxrw_Hje34DjzkDjKo8-MpdZzT-xN6MVUHSwuUw@mail.gmail.com>
References: <CADiAo4LZ0e=Goo13SKodFo6PL0iEsVG5tPsdQ6jp6yhOsBX4DQ@mail.gmail.com>
 <201208141907.13002.yann.morin.1998@free.fr>
 <CADiAo4Jn7525qF0+_mXhDT2j5-k+W-SCsXf1x8oaAEuNvWz66g@mail.gmail.com>
 <20120817143017.65099bd6@skate>
 <CADiAo4LX4q5Vxrw_Hje34DjzkDjKo8-MpdZzT-xN6MVUHSwuUw@mail.gmail.com>
Message-ID: <20120817151717.64d943d6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 17 Aug 2012 08:46:32 -0400,
Dmitry Golubovsky <golubovsky@gmail.com> a ?crit :

> Busybox developers increased this length to 64 for now ;) It is in the
> daily snapshot and eventually will propagate to Buildroot (or can even
> be enabled now by selecting daily snapshot).
> 
> Maybe this will be sufficient.

If the change has been accepted upstream in Busybox, then we can
include a patch in Buildroot until a new version of Busybox gets
released, if that makes things easier/nicer for you.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
