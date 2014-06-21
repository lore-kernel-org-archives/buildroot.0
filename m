From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jun 2014 15:04:59 +0200
Subject: [Buildroot] Help about gstreamer h264 in buildroot
In-Reply-To: <53A566AE.7020800@gmail.com>
References: <539C13BA.5000106@gmail.com>
 <20140614141451.6780163c@free-electrons.com>
 <53A566AE.7020800@gmail.com>
Message-ID: <20140621150459.267bce66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Sat, 21 Jun 2014 13:04:14 +0200, Marco Trapanese wrote:

> Hi Thomas, after fixing the gst-ffmpeg issue thanks to Arnout 
> Vandecappelle, I'm still trying to compile buildroot and now I'm facing 
> the problem you reported above.

Weird that I didn't fall into the issue you reported originally,
despite using the Buildroot configuration you provided.

> Do you confirm this doesn't work?

I don't confirm anything, it just didn't build here, with the error
messages that I've posted.

> I'm very confused how to skip around all those bugs in order to have a 
> functional buildroot environment.

You shouldn't try to "skip around", but instead you should help us to
_fix_ those issues. The support for Qt5+OpenGL is still fairly, and
since there are multiple OpenGL implementation, generally one for each
platform, we haven't yet tested and fixed all the possible
combinations. It is thanks to bug reports provided by users like you
that we can progressively fix those issues, and provide a build system
that is more and more capable to build all configurations correctly
out-of-the-box.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
