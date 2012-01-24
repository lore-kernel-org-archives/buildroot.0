From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2012 11:31:48 +0100
Subject: [Buildroot] [PATCH 00/14] Add EFL packages to buildroot
In-Reply-To: <CAFbHwiSeN_7-GHLg-2Xc=+OYszabK9pT3MsshHTHLQUsdzaJwA@mail.gmail.com>
References: <CAFbHwiQEzOV7_wK647kRDjXZTWxEEPjnXo3uLfpOk=u1AbxszQ@mail.gmail.com>
 <20120123222150.7f28bf58@skate>
 <CAFbHwiSeN_7-GHLg-2Xc=+OYszabK9pT3MsshHTHLQUsdzaJwA@mail.gmail.com>
Message-ID: <20120124113148.18428f3f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Will,

Le Tue, 24 Jan 2012 10:26:10 +0000,
Will Newton <will.newton@gmail.com> a ?crit :

> I believe after the patch series by Arnout committed on January 18th
> that host deps are calculated automatically. I'm not 100% sure if I
> got it right but it builds so it appears that it's at least partially
> right. I suppose one downside of that change is that it does make it
> much harder to figure out who is depending on what.

Yes, my bad. I looked at your patches before reading the backlog of
Buildroot e-mails accumulated during my holidays, so I didn't notice
that Arnout patchset was merged. Indeed, it is now normal to have
host packages without any HOST_FOO_DEPENDENCIES variable.

Thanks for your work!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
