From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 13:29:15 +0200
Subject: [Buildroot] Qt tribulations take 2
In-Reply-To: <502D2DD1.1020604@relinux.de>
References: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
 <20120713165557.1b39651c@skate>
 <CALo-6+gv+zb1peT7ngOGLL7VnS6xpCUOZRn_J6CD86Kmn7vX=A@mail.gmail.com>
 <20120714182555.4b7b267d@jl-desk-LL>
 <CALo-6+hSrFrqua1s48qzYn9J8qF0F6=zCpgfbguO2hf3VmqeOQ@mail.gmail.com>
 <20120715010542.1a23ba0f@skate> <50029C65.9010004@mind.be>
 <20120715123854.3d6c11f1@skate> <502D2DD1.1020604@relinux.de>
Message-ID: <20120817132915.5c1ab3f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 16 Aug 2012 19:28:49 +0200,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> After spending several hours in this trap this sounds like a real good
> Idea to me.

Then please send a patch adding an unexport QMAKESPEC to the main
Buildroot Makefile, with a short comment on the top that explains why
it is needed. You will find other variables already being unexported,
such as PKG_CONFIG_PATH.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
