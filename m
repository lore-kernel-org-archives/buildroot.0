From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Dec 2014 17:07:45 +0100
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <412765297.29393617.1418831613614.JavaMail.root@openwide.fr>
References: <1418831416.4132.19.camel@synopsys.com>
 <412765297.29393617.1418831613614.JavaMail.root@openwide.fr>
Message-ID: <20141217170745.52d306d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Wed, 17 Dec 2014 16:53:33 +0100 (CET), Jeremy Rosen wrote:

> Doesn't your patch allow multiple getty ? I don't think console
>  does that...
> 
> that was a feature I was interested in.

multiple getty is really something we want to leave to project-specific
customization of the inittab. Use a rootfs overlay or a post-build
script to do that. There are too many potential customizations that can
be done in inittab to allow all of them to be done through Buildroot
config options.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
