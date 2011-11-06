From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2011 14:38:46 +0100
Subject: [Buildroot] buildroot stops at pango compilation
In-Reply-To: <CAC=eiqy1_-atsKHX4SE0a_KS1b_qJdzzihr+emoSSY0RDco1mQ@mail.gmail.com>
References: <CAC=eiqyR36E133EnLBVZNFWsHzx7ayg0Z=4rq2LWOpYE4xTaMw@mail.gmail.com>
 <CAC=eiqy1_-atsKHX4SE0a_KS1b_qJdzzihr+emoSSY0RDco1mQ@mail.gmail.com>
Message-ID: <20111106143846.46fa1d9b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 6 Nov 2011 20:20:11 +0700,
Daniel Potapov <yeso@bk.ru> a ?crit :

> I'm trying to compile stable version buildroot 2011.08 with libgtk
> support, but it stops at pango compilation (I've attached output) with
> a lot of such messages:

Can you please post your Buildroot .config, and also remove
the /usr/local/arm_linux_4.2/bin directory from your PATH in order to
make sure the cross-compiler installed here does not conflict with the
one Buildroot has generated ?

Could you also give some details on what your distribution is (and
which version) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
