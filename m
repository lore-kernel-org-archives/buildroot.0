From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jan 2013 11:43:45 +0100
Subject: [Buildroot] [PATCH 10/20] xdriver_xf86-video-s3: remove package
In-Reply-To: <50E4CAB4.3010908@petroprogram.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <44205c6a9db9d3496db982f686d29fe9d096a088.1357125961.git.thomas.petazzoni@free-electrons.com>
 <50E43558.2000003@petroprogram.com> <20130102175740.359fc5ce@skate>
 <50E48268.401@zacarias.com.ar> <20130102200144.5ed56106@skate>
 <50E4CAB4.3010908@petroprogram.com>
Message-ID: <20130103114345.1f74251d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Thu, 03 Jan 2013 02:03:00 +0200, Stefan Fr?berg wrote:

> I happen to have old (from 2005) laptop with integrated SiS inside it,
> gathering dust.
> 
> Does that count ?
> :-)
> 
> Last time I tried it with my buildroot build linux distro it worked
> like a charm.
> Actually better than that. For all the various linux distros and
> flavors I have
> stuffed into that crappy lil laptop, this was the fastest :-)

The patch set removes "sisusb", not "sis", which is still part of X.org
releases.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
