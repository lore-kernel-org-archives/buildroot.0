From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 May 2013 20:29:00 +0200
Subject: [Buildroot] [PATCH v4 0/7] Gstreamer 1.X patch series
In-Reply-To: <1368468241-23319-1-git-send-email-spenser@gillilanding.com>
References: <1368468241-23319-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130513202900.5ffa3bd2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Mon, 13 May 2013 13:03:54 -0500, Spenser Gilliland wrote:
> The subsequent patches add Gstreamer 1.X to Buildroot. Gstreamer has many dependencies which can be disabled or enabled as plugins. For an example fo adding a plugin which requires a dependent library, see patches 6 and 7 of the series.

It would be good if your e-mail (including cover letters) were wrapped
at ~80 columns.

For patches 1 to 5, could you summarize the difference between those
gstreamer1 packages compared to the corresponding gstreamer packages?

Is it just a sed s/GSTREAMER/GSTREAMER1/ everywhere, or have you made
some more extensive changes?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
