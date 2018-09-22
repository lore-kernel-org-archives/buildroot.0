From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 18:38:02 +0200
Subject: [Buildroot] [PATCH 2/2] support/scripts/graph-build-time: add
 support for timeline graphing
In-Reply-To: <CANQCQpZxecBwrMd_o9-v8XtUxGZrYj6egngCA0V0Qw3WgrPD9w@mail.gmail.com>
References: <20180921133117.9300-1-thomas.petazzoni@bootlin.com>
 <20180921133117.9300-3-thomas.petazzoni@bootlin.com>
 <CANQCQpZxecBwrMd_o9-v8XtUxGZrYj6egngCA0V0Qw3WgrPD9w@mail.gmail.com>
Message-ID: <20180922183802.00bc2ed4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 08:47:54 -0500, Matthew Weber wrote:

> > The graph-build make target is extended to also generate this new
> > timeline graph.  
> 
> Is there a way to remove the page boundary or split the data so larger
> builds are readable?  I'm not sure of the readablility point but my
> build test of ~80-100pkg target was overlapping.

There should be no page boundary, but I indeed haven't tested yet
larger builds, and the script may need additional tweaks.

I'll try with some larger build and see if I can improve the script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
