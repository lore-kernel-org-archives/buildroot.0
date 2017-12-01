From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 16:06:30 +0100
Subject: [Buildroot] Putting qtwebkit on a diet
In-Reply-To: <7264cc95-a3cd-a416-de49-cf06fe865ef1@petroprogram.com>
References: <7f8d2d60-b870-61f1-df5e-ed83f9923c39@petroprogram.com>
 <56abbedc-c97e-46e6-5458-7b6c2b18ba18@petroprogram.com>
 <20171130090230.79cedfe7@windsurf.home>
 <f7391a80-8158-7b15-b1ef-d6386982f426@petroprogram.com>
 <20171201151034.44c460b3@windsurf.lan>
 <7264cc95-a3cd-a416-de49-cf06fe865ef1@petroprogram.com>
Message-ID: <20171201160630.392cc220@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 Dec 2017 16:51:37 +0200, Stefan Fr?berg wrote:

> I guess on non-ARM the optimize for size feature is doing just? -Os but
> on ARM it also needs thumb enabled.
> Otherwise it nags "Not supported ARM architecture" (this while building
> for raspberry pi3)

Then we don't want additional options for this, because we already have
top-level options to select Thumb2 and -Os.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
