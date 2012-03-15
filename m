From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Mar 2012 18:49:26 +0100
Subject: [Buildroot] compiling microperl
In-Reply-To: <CALo-6+gEPp06RGrwt-0dYPJY+-q7-CX3vF8R-duaYVe4XBup+Q@mail.gmail.com>
References: <CALo-6+gEPp06RGrwt-0dYPJY+-q7-CX3vF8R-duaYVe4XBup+Q@mail.gmail.com>
Message-ID: <20120315184926.020db031@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

Le Thu, 15 Mar 2012 10:31:24 -0700,
Charles Krinke <charles.krinke@gmail.com> a ?crit :

> I wonder if someone would be so kind as to offer a clue, or at least a
> bread crumb to figuring this out.

See
http://git.buildroot.net/buildroot/commit/package/microperl/microperl.mk?id=cb9a5877b88787f176215c5addb8c1be225a39d0

It lacks -lm in the flags, and this commit fixes it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
