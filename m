From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Feb 2013 21:40:18 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <510F9768.4020907@carallon.com>
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 <510F9155.6050904@carallon.com>
 <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
 <510F9768.4020907@carallon.com>
Message-ID: <20130204214018.2efc0bfb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, Nicolas,

On Mon, 04 Feb 2013 11:11:36 +0000, Will Wagner wrote:

> You can find my work on updating to x11r7.7 on gitorious at
> https://gitorious.org/willw-buildroot/willw-buildroot/commits/remotes/gitorious/x11r7.7 
> 
> It is now based on a much older buildroot version and needs a lot of 
> work to update.

Also you could look at the support/scripts/xorg-release script I added
some time ago. For each X.org component, it compares the version we
have in Buildroot with the version available in a certain X.org
release (currently X11R7.7).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
