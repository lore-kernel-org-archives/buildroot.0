From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 19:05:44 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
 the package on foo-reconfigure
In-Reply-To: <CAAXf6LX0FwkjE8xHqjwn1TOS7cOdbVwjBRLOS7tLnKJcgBtDuQ@mail.gmail.com>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LUrhOVJJG-1_pf4vzKMh1=7WG0xop9XY6m9fva-FepHzA@mail.gmail.com>
 <20160914110143.2f25e8a9@free-electrons.com>
 <CAAXf6LX0FwkjE8xHqjwn1TOS7cOdbVwjBRLOS7tLnKJcgBtDuQ@mail.gmail.com>
Message-ID: <20160916190544.540efd8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Sep 2016 19:42:30 +0200, Thomas De Schampheleire wrote:

> I think the answer to this question is simple: one of the goals was to allow:
> 
> 'make clean linux-menuconfig'
> 
> without this step first building all dependencies of linux (which is
> quite a lot).
> If the kconfig configuration would be part of CONFIGURE_CMDS, then
> we'd end up in that situation.

Gaah, yes, indeed, makes sense. Can we write this somewhere?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
