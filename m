From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Nov 2011 22:39:02 +0100
Subject: [Buildroot] commit bf4465 (ncurses: fix hanging installation
 due to old version of tic)
In-Reply-To: <CAHUNapR1xfZahWU+Ru+Vb5hdOCH1tvz1DqT-aSBEVuku7aEHNA@mail.gmail.com>
References: <CAHUNapT5XD1ghKZgfH1nVsiOEqpjfxUcTTHp5NCNa_C7+rEEJg@mail.gmail.com>
 <20111124215742.7678dab4@skate>
 <CAHUNapR1xfZahWU+Ru+Vb5hdOCH1tvz1DqT-aSBEVuku7aEHNA@mail.gmail.com>
Message-ID: <20111124223902.4258ab95@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 24 Nov 2011 16:08:47 -0500,
Trevor Woerner <twoerner@gmail.com> a ?crit :

> Ah, and the ncurses packages does not. Shouldn't it?

Not if autoreconfiguring the package is not needed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
