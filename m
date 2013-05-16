From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 16 May 2013 09:35:55 -0500
Subject: [Buildroot] [PATCH v6 09/10] libopenmax: Add libopenmax virtual
	package
In-Reply-To: <20130516162216.299938c4@skate>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
 <1368655178-19176-10-git-send-email-spenser@gillilanding.com>
 <20130516095842.78066d20@skate>
 <CAEBucnBvGuHMM3cgGcaSyJ3M_ShpNuUKEW+8TRz4TQTmpDsh9Q@mail.gmail.com>
 <20130516162216.299938c4@skate>
Message-ID: <CAEBucnD5w4PEHBYe771cqTyy2i7h0yRZ5Fh+Bb3PVymt3W2=MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> Argh, my bad. Stupid packages in subdirectories. I didn't remember
> having bellagio, so I checked by doing package/bell<tab><tab>, and
> nothing showed up, making me -incorrectly- conclude that this package
> didn't exist.

If we were to do a cleanup. I'd actually argue that the entire
multimedia directory needs to go away. Gstreamer/gstreamer1 would need
their own directories but everything else could be in the root.
However, this is not really in scope for the patch series at hand.

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
