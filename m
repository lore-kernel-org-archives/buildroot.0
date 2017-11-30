From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 09:02:30 +0100
Subject: [Buildroot] Putting qtwebkit on a diet
In-Reply-To: <56abbedc-c97e-46e6-5458-7b6c2b18ba18@petroprogram.com>
References: <7f8d2d60-b870-61f1-df5e-ed83f9923c39@petroprogram.com>
 <56abbedc-c97e-46e6-5458-7b6c2b18ba18@petroprogram.com>
Message-ID: <20171130090230.79cedfe7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 01:49:28 +0200, Stefan Fr?berg wrote:
> Update: I just tried it and the results are these:
> 
> Stock, uclibc qt5webkit size on target:
> 32MB
> 
> Modified uclibc qt5webkit build with "minimal" and
> "use_cross_platform_context_menus" (needed for successfull build)
> settings, size on target:
> 22 MB
> 
> So it would save about 10 MB

I think that's an interesting space saving (and perhaps build time
saving as well ?). So yes, you can go ahead and submit patches to
implement more fine-grained configuration for qt5webkit :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
