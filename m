From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 23:50:30 +0200
Subject: [Buildroot] [PATCH 3/4] arch: do not distinguish revisions of
 ARM1136JF-S
In-Reply-To: <CA+sos781LFuT-ukvPyKnOgtdYd7uVUHb3FCX8BCSz7sox11T9Q@mail.gmail.com>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140915213339.GC3878@free.fr>
 <20140915233916.55c17894@free-electrons.com>
 <CA+sos781LFuT-ukvPyKnOgtdYd7uVUHb3FCX8BCSz7sox11T9Q@mail.gmail.com>
Message-ID: <20140915235030.57b47c34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Mon, 15 Sep 2014 23:44:52 +0200, Beno?t Th?baudeau wrote:

> >> As suggested on IRC, move the BR2_arm1136jf_s_r1 to Config.legacy, and
> >> have it select BR2_arm1136jf_s, so the user can re-use a defconfig.
> >
> > Hum, why just BR2_arm1136jf_s_r1 and not BR2_arm1136jf_s_r0 ?
> 
> This issue disappears if -march and -mtune are kept and -mcpu removed
> as I suggested.

Do you have an example C code that doesn't generate the same assembly
code between BR2_arm1136jf_s_r0 and BR2_arm1136jf_s_r1 ? It would be
useful for my testing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
