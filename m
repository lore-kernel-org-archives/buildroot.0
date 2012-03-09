From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Mar 2012 14:33:26 +0100
Subject: [Buildroot] [RFC] Request for comment for branch
 for-2012.05/misc-cleanups
In-Reply-To: <CAAAP30GZZM5F=f_iHZwUs+rgDGvHUgvFLm_Wdo7DLc4J1yQX3g@mail.gmail.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <CAAAP30GZZM5F=f_iHZwUs+rgDGvHUgvFLm_Wdo7DLc4J1yQX3g@mail.gmail.com>
Message-ID: <20120309143326.24a2b90e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 9 Mar 2012 10:07:29 -0300,
Alexandre Pereira da Silva <aletes.xgr@gmail.com> a ?crit :

> I think the pkg-* makefiles could be moved from the packages directory
> as they are used by the kernel and bootloaders as well.
> Maybe move them to the support directory.

Yeah, I was also wondering about this. I don't know if support/ is the
right place, or if we need yet another top-level directory such as
include/ or mk/ or whatever. What are others opinion?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
