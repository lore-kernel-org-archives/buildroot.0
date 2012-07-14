From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 01:05:42 +0200
Subject: [Buildroot] Qt tribulations take 2
In-Reply-To: <CALo-6+hSrFrqua1s48qzYn9J8qF0F6=zCpgfbguO2hf3VmqeOQ@mail.gmail.com>
References: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
 <20120713165557.1b39651c@skate>
 <CALo-6+gv+zb1peT7ngOGLL7VnS6xpCUOZRn_J6CD86Kmn7vX=A@mail.gmail.com>
 <20120714182555.4b7b267d@jl-desk-LL>
 <CALo-6+hSrFrqua1s48qzYn9J8qF0F6=zCpgfbguO2hf3VmqeOQ@mail.gmail.com>
Message-ID: <20120715010542.1a23ba0f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 14 Jul 2012 15:00:18 -0700,
Charles Krinke <charles.krinke@gmail.com> a ?crit :

> You were right as usual. It was an environment variable. It was
> QMAKESPEC which was set by my installation of the TI SDK a week ago. I
> should have checked my  .bashrc after installing the SDK, but I did
> not expect any environment changes as a result of installing a
> toolchain and u-boot source.

Then we should probably unset this environment variable in the main
Makefile. It seems like a lot of environment variables are causing
various issues in the build. Is there any way to simply unset all
environments variables, except the few we are actually interested in?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
