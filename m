From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2011 17:06:05 +0100
Subject: [Buildroot] buildroot stops at pango compilation
In-Reply-To: <CAC=eiqyLq=uBboFLHDNM=ph4m8aOHcZN8799BL+5arheYLbeHw@mail.gmail.com>
References: <CAC=eiqyR36E133EnLBVZNFWsHzx7ayg0Z=4rq2LWOpYE4xTaMw@mail.gmail.com>
 <CAC=eiqy1_-atsKHX4SE0a_KS1b_qJdzzihr+emoSSY0RDco1mQ@mail.gmail.com>
 <20111106143846.46fa1d9b@skate>
 <CAC=eiqwhb=ZknTvjhHPquZ-hhtf6u50vNYn6Nc_EPp-ydMtCkQ@mail.gmail.com>
 <20111106162606.491d895c@skate>
 <CAC=eiqyLq=uBboFLHDNM=ph4m8aOHcZN8799BL+5arheYLbeHw@mail.gmail.com>
Message-ID: <20111106170605.41259586@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 6 Nov 2011 22:52:14 +0700,
Daniel Potapov <yeso@bk.ru> a ?crit :

> Ok, I've checked EABI in buildroot config and uclibc, but compilation
> fails with messages:
> make: /home/user/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc:
> Command not found
> make: ***
> [/home/user/buildroot/buildroot-2011.08/output/toolchain/uClibc-0.9.32/.configured]
> Error 127
> 
> where I can get arm-unknown-linux-uclibcgnueabi-gcc ?

Buildroot generates it. Please do "make clean; make" to rebuild from
scratch. EABI vs. OABI is a global toolchain option, so you need to
rebuild everything.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
