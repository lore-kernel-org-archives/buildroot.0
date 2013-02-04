From: Nicolas Dechesne <ndec13@gmail.com>
Date: Mon, 4 Feb 2013 21:49:50 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <20130204214018.2efc0bfb@skate>
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 <510F9155.6050904@carallon.com>
 <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
 <510F9768.4020907@carallon.com> <20130204214018.2efc0bfb@skate>
Message-ID: <CAOT3miKRqb5EvLgrLPkxK32YHLj5QOsqgP5n0zy__rb5L22Kbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2013 at 9:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Also you could look at the support/scripts/xorg-release script I added
> some time ago. For each X.org component, it compares the version we
> have in Buildroot with the version available in a certain X.org
> release (currently X11R7.7).

ouch.... nice scripts! i think i was just re-doing them locally ;-)
thanks for pointing this out.

especially because it explains why Will was trying to remove all the
components mentioned in my previous email.

i would tend to say that the scripts is wrong when it 'recomments'
'remove from buildroot'. It looks like you check only for the
components in the 'src/everything' folder, however as I said in my
previous email, some components are generally not included in the
release, like the applications.
