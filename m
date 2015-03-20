From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:35:37 +0100
Subject: [Buildroot] RFC: systemd and service files cleanup
In-Reply-To: <CANPyyuPobYDV9qWG5u0OzrVy9WtCy0KmfrQUBCHPvqqJEa4kMg@mail.gmail.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <20150320142055.5ba1af4c@free-electrons.com>
 <CANPyyuPobYDV9qWG5u0OzrVy9WtCy0KmfrQUBCHPvqqJEa4kMg@mail.gmail.com>
Message-ID: <20150320143537.33c68032@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Fri, 20 Mar 2015 09:27:51 -0400, Mike Williams wrote:

> > Is there any strong reason for switching to absolute symbolic links?
> 
> No, they were just relative to the files that used to be in /etc and I
> used absolute because it was easier for me to not screw them up when
> changing them :). How about you or one of the other buildroot core
> team tell me how you want it done, and I'll re-roll the patch series.

Ok, then I believe staying with relative symlinks is probably the
safest option, since that's generally what we're doing in the rest of
Buildroot.

> Will do. I think after the next series of this patch, and a couple new
> spins of other patches, we should be able to send you a large list of
> patches to commit.

Ok, good. If some of the patches need a bit of rework, don't hesitate
to pick them up and resend an updated version as needed.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
