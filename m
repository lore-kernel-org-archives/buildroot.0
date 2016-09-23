From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 16:25:42 +0200
Subject: [Buildroot] [PATCH] gst1-imx: add menuconfig to select each
 plugin individually
In-Reply-To: <20160923134047.l2jl6c2kwmyrbgj7@t450s.lan>
References: <20160916131038.23240-1-gary.bisson@boundarydevices.com>
 <20160920210425.1ca82f17@free-electrons.com>
 <20160920224355.l76a3kggupuiugok@t450s.lan>
 <1af982ba-faf7-9cd7-73ae-c32e45286f34@mind.be>
 <20160923125835.mr63ylhk25qb3gt2@t450s.lan>
 <20160923151306.1fd4e4c7@free-electrons.com>
 <20160923134047.l2jl6c2kwmyrbgj7@t450s.lan>
Message-ID: <20160923162542.69ceb2b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 15:40:47 +0200, Gary Bisson wrote:

> > If only a single dependency is needed for those codecs, is it really
> > necessary to have different options to enable/disable them? How much
> > space do they take each?  
> 
> They actually end up in the same libgstimxaudio.so file. But the problem
> of redundancy remains for the other plugins as well:
> - Both eglvivsink and g2d depend on imx-gpu-viv
> - Both PXP and IPU depend on the kernel headers

Right. OK, then maybe we need to keep your original proposal in the
end. Sorry for changing my mind so often :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
