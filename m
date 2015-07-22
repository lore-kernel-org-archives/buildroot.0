From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 13:31:33 +0200
Subject: [Buildroot] [PATCH 01/11] package/ulogd: remove autoreconf
In-Reply-To: <55AF7084.9020601@openwide.fr>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
 <20150720225609.6644867c@free-electrons.com>
 <55AF7084.9020601@openwide.fr>
Message-ID: <20150722133133.740b7965@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Wed, 22 Jul 2015 12:29:24 +0200, Romain Naour wrote:

> > All 11 patches applied, thanks. I have not tested them, I trust you :)
> > The autobuilders will tell me if I was right or not! :-)
> 
> I haven't see any build failure due to this series :)
> So, I guess you was right but maybe there are too many build failure in
> autobuilders to see something ;-)
> 
> Seriously, I've tested each packages by selecting each of them in the config and
> build the entire config to see if all build fine.

Yes, so far I haven't identified any of the build failure to be caused
by this series, so it looks good. Of course as you say, there are quite
a lot of build failures currently, so it's hard to say if it really
didn't cause any regression.

But no worries, I'm sure it's going to be OK :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
