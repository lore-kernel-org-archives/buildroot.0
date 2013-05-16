From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 16:41:43 +0200
Subject: [Buildroot] [PATCH v6 10/10] gst-omx: add gst-omx package
In-Reply-To: <CAEBucnCt0ed=iKRhMR1b4Dc2+wFWe27KxPHJ8Dx1_1E5uyjwdw@mail.gmail.com>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
 <1368655178-19176-11-git-send-email-spenser@gillilanding.com>
 <20130516101052.737192f2@skate>
 <CAEBucnCt0ed=iKRhMR1b4Dc2+wFWe27KxPHJ8Dx1_1E5uyjwdw@mail.gmail.com>
Message-ID: <20130516164143.249e761c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 16 May 2013 09:29:53 -0500, Spenser Gilliland wrote:

> > One question: it would be good to mention, in your cover letter, on
> > which platform this was tested. Was it tested on RPi? With what command
> > line/tool?
> 
> I'll add this info to the cover letter.  It was tested with gst-launch.

Ok. Since your branch is named rpi, I suppose it has been tested on the
Rasberry Pi. Have you build tested the thing against Bellagio? Can you
clarify for me which hardware platforms does Bellagio support? Or maybe
it's a purely software implementation of OpenMAX, a little bit like the
software rasterizer of Mesa is a pure software implementation of
OpenGL ?

And, yes, having the details on how to test this will be useful for
other users of the Rasberry Pi who may want to test your patches (and
hopefully add their Tested-by).

Also, I'm pretty sure we should find a way to collect this information
of how a package can be used/tested. Should it be in the main
documentation? A per-package readme.txt when it makes sense? In the
help text of the package kconfig option?

> I'm going to wait another couple days before I sent another version
> just in case more reviews come in.  If you want to see the changes in
> the meantime take a look at the rpi branch on my github buildroot
> clone at https://github.com/Spenser309/buildroot/commits/rpi .

Ok, thanks, sounds good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
