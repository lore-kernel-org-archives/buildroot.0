From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jan 2013 12:20:53 +0100
Subject: [Buildroot] [PATCH 10/20] xdriver_xf86-video-s3: remove package
In-Reply-To: <50E561BB.9060102@zacarias.com.ar>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <44205c6a9db9d3496db982f686d29fe9d096a088.1357125961.git.thomas.petazzoni@free-electrons.com>
 <50E43558.2000003@petroprogram.com> <20130102175740.359fc5ce@skate>
 <50E48268.401@zacarias.com.ar> <20130102200144.5ed56106@skate>
 <50E4875F.6090305@zacarias.com.ar> <20130103114252.18661c1e@skate>
 <50E561BB.9060102@zacarias.com.ar>
Message-ID: <20130103122053.02304910@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 03 Jan 2013 07:47:23 -0300, Gustavo Zacarias wrote:
> On 01/03/2013 07:42 AM, Thomas Petazzoni wrote:
> 
> > Since you were replying to a patch removing a X.org driver because
> > the driver has been removed from X.org releases, I thought your SiS
> > driver was in this case, but it's not.
> > 
> > So, your point was that beyond the driver I removed, a bunch of
> > others could be removed, because even though X.org still has those
> > drivers in their releases, the hardware is so ancient that it
> > doesn't make sense to keep the drivers?
> 
> Yes, that exactly.

Ok, understood.

Indeed, a lot more drivers could be removed. For now, I just limited
myself to the drivers that have been removed from X.org releases, since
those ones shouldn't raise a lot of discussion. It's only a first step,
obviously.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
