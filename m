From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Feb 2013 22:30:24 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <CAOT3miKRqb5EvLgrLPkxK32YHLj5QOsqgP5n0zy__rb5L22Kbg@mail.gmail.com>
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 <510F9155.6050904@carallon.com>
 <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
 <510F9768.4020907@carallon.com> <20130204214018.2efc0bfb@skate>
 <CAOT3miKRqb5EvLgrLPkxK32YHLj5QOsqgP5n0zy__rb5L22Kbg@mail.gmail.com>
Message-ID: <20130204223024.0e687d5b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Dechesne,

On Mon, 4 Feb 2013 21:49:50 +0100, Nicolas Dechesne wrote:

> especially because it explains why Will was trying to remove all the
> components mentioned in my previous email.
> 
> i would tend to say that the scripts is wrong when it 'recomments'
> 'remove from buildroot'. It looks like you check only for the
> components in the 'src/everything' folder, however as I said in my
> previous email, some components are generally not included in the
> release, like the applications.

Yes, I am not sure what to do with the applications. Some of them
appear to be part of X.org releases, but not all of them. Not sure what
to do about these.

Do you have a suggestion?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
