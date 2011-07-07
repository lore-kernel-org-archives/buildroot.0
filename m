From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2011 15:44:16 +0200
Subject: [Buildroot] [PATCH 6/9] gst-ffmpeg: depend on orc if it is
 enabled
In-Reply-To: <1310044678.2076.23.camel@sven>
References: <1310024348-3575-1-git-send-email-s.neumann@raumfeld.com>
 <1310024348-3575-7-git-send-email-s.neumann@raumfeld.com>
 <20110707104327.38439e72@skate> <1310044678.2076.23.camel@sven>
Message-ID: <20110707154416.36cfdb98@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 07 Jul 2011 15:17:58 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> Oops, I should have indeed split this into two patches. And I would
> probably only have submitted the orc dependency. The switch to the
> internal ffmpeg is a good choice for us, but might not be desirable
> for others.

Ok, could you resubmit a patch that only adds the orc dependency ?

> Ideally there would be a br2 configuration option for this.

Yes, this could be a solution. But is there any special advantage in
using the internal ffmpeg vs. the system ffmpeg ? Of course, when you
build things manually, using the internal ffmpeg is nicer, but since
Buildroot takes care of the dependency, what is the advantage of the
internal ffmpeg ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
