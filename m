From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 16:38:36 +0200
Subject: [Buildroot] [PATCH v6 09/10] libopenmax: Add libopenmax virtual
 package
In-Reply-To: <CAEBucnD5w4PEHBYe771cqTyy2i7h0yRZ5Fh+Bb3PVymt3W2=MA@mail.gmail.com>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
 <1368655178-19176-10-git-send-email-spenser@gillilanding.com>
 <20130516095842.78066d20@skate>
 <CAEBucnBvGuHMM3cgGcaSyJ3M_ShpNuUKEW+8TRz4TQTmpDsh9Q@mail.gmail.com>
 <20130516162216.299938c4@skate>
 <CAEBucnD5w4PEHBYe771cqTyy2i7h0yRZ5Fh+Bb3PVymt3W2=MA@mail.gmail.com>
Message-ID: <20130516163836.3a457466@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 16 May 2013 09:35:55 -0500, Spenser Gilliland wrote:

> If we were to do a cleanup. I'd actually argue that the entire
> multimedia directory needs to go away. Gstreamer/gstreamer1 would need
> their own directories but everything else could be in the root.

Right. Peter also like to have everything at the root, so I believe he
will most likely not object to such a move.

> However, this is not really in scope for the patch series at hand.

Definitely.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
