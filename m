From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 11:30:25 +0100
Subject: [Buildroot] [PATCH] gst1-shark: new package
In-Reply-To: <20190125091322.27522-1-judge.packham@gmail.com>
References: <20190125091322.27522-1-judge.packham@gmail.com>
Message-ID: <20190206113025.31155bfd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Jan 2019 22:13:22 +1300
Chris Packham <judge.packham@gmail.com> wrote:

> GstShark leverages GStreamers newest instrumentation subsystem by
> installing a set of custom hooks to the trace points. A variety of data
> analytics are extracted and presented to the user in a graphical,
> friendly way.
> 
> https://developer.ridgerun.com/wiki/index.php?title=GstShark
> https://github.com/RidgeRun/gst-shark
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Jo?o Victor Oliveira <jv.oliveirag@gmail.com>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Igor Miranda <igorcmiranda3110@gmail.com>

Applied, with the following changes:

    [Thomas:
     - fix package prompt to be gtk1-shark in Config.in
     - license is LGPL-2.1+, not LGPL-2.1
     - add entry to DEVELOPERS file]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
