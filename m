From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Feb 2013 23:54:38 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <CAOT3miKU=Wg6rQeyb4r6Lj6Yv9yDaHxqWCAtQ4_0VKGEw558Ug@mail.gmail.com>
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 <510F9155.6050904@carallon.com>
 <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
 <510F9768.4020907@carallon.com> <20130204214018.2efc0bfb@skate>
 <CAOT3miKRqb5EvLgrLPkxK32YHLj5QOsqgP5n0zy__rb5L22Kbg@mail.gmail.com>
 <20130204223024.0e687d5b@skate>
 <CAOT3miJUfF3Oc2XFXJRiLCtMxtsHSWZWWLGvGyc+zNkqHGgnEw@mail.gmail.com>
 <20130204232435.69179214@skate>
 <CAOT3miKU=Wg6rQeyb4r6Lj6Yv9yDaHxqWCAtQ4_0VKGEw558Ug@mail.gmail.com>
Message-ID: <20130204235438.0e1626e1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Dechesne,

On Mon, 4 Feb 2013 23:45:50 +0100, Nicolas Dechesne wrote:

> this seems a better option indeed. i will try to cook a patch for
> that. i assume something like packages/x11apps should be a good
> package name, or perhaps x11_xorg_apps to make the distinction between
> apps from x.org and any other app that would use X11..

I am not quite sure about this solution, because it means that all
packages that are not part of official X.org releases would have to be
moved away from the package/x11r7 directory. For example, the tslib
driver I pointed, but they are also other X.org drivers that could be
added in the future and that are not part of official X.org releases.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
