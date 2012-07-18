From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 18 Jul 2012 09:23:20 +0200
Subject: [Buildroot] [PATCH 1/6] Revert "Microblaze: build kernel with
 device tree"
In-Reply-To: <CAEBucnCan1vRHv4GkhYXGHnrb3Nrtg0rOtwiLY_fTuARuV0W2g@mail.gmail.com>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
 <1342528042-10038-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAEBucnCan1vRHv4GkhYXGHnrb3Nrtg0rOtwiLY_fTuARuV0W2g@mail.gmail.com>
Message-ID: <50066468.1070102@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please keep the list in CC.

Le 17/07/2012 21:21, Spenser Gilliland a ?crit :
> I'm using this functionality.  Is there a way to make this work
> without the patch?

The next patches introduce a similar functionnality. You can look at
patch 6 to see the changes made to the s6lx9 configuration.

What are you using the previous behaviour for ? To build a simpleImage ?

Anyway, I don't have any microblaze hardware, so if you could test it,
it would be nice.

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
