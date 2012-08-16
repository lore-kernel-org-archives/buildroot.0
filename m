From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 16 Aug 2012 19:28:49 +0200
Subject: [Buildroot] Qt tribulations take 2
In-Reply-To: <20120715123854.3d6c11f1@skate>
References: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
 <20120713165557.1b39651c@skate>
 <CALo-6+gv+zb1peT7ngOGLL7VnS6xpCUOZRn_J6CD86Kmn7vX=A@mail.gmail.com>
 <20120714182555.4b7b267d@jl-desk-LL>
 <CALo-6+hSrFrqua1s48qzYn9J8qF0F6=zCpgfbguO2hf3VmqeOQ@mail.gmail.com>
 <20120715010542.1a23ba0f@skate> <50029C65.9010004@mind.be>
 <20120715123854.3d6c11f1@skate>
Message-ID: <502D2DD1.1020604@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 15.07.2012 12:38, schrieb Thomas Petazzoni:
> Well, there are already many other environment variables that may break
> the build and that we are either checking in
> support/dependencies/dependencies.sh, or unsetting in main Makefile.
> Shouldn't we do the same for QMAKESPEC?
>
After spending several hours in this trap this sounds like a real good
Idea to me.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
