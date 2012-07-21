From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jul 2012 15:26:03 +0200
Subject: [Buildroot] [PATCH] Bump gpsd from version 2.95 to version 3.7
In-Reply-To: <CAHt8ZCN-KYmfjbp4R3zwhLnRKrPUnrS1TziaECh8zvcEWZYddg@mail.gmail.com>
References: <1342779078-2927-1-git-send-email-spdawson@gmail.com>
 <20120720201626.707f66a2@skate>
 <CAHt8ZCN-KYmfjbp4R3zwhLnRKrPUnrS1TziaECh8zvcEWZYddg@mail.gmail.com>
Message-ID: <20120721152603.01df6a00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 21 Jul 2012 10:07:38 +0100,
Simon Dawson <spdawson@gmail.com> a ?crit :

> > Is there a non-ugly variant of this in the works?
> 
> Not at present, I'm afraid. What would you suggest? Obviously, I can
> kick off the process of trying to get a fix into gpsd upstream. That
> could be a slow process; so, in the meantime, is it acceptable to have
> this (ugly, but small) patch in Buildroot?

Yes, it is perfectly acceptable. It's just that we generally try to
start the process of getting problems fixed upstream at the same time,
so hopefully at some point in the future (which may be a distant
point), such patches can be removed.

> >> +GPSD_DEPENDENCIES = host-scons host-python
> >
> > Do we really need a host-python here?
> 
> You're quite right: there is no need for the Python version to be the
> same on host and target. I'll remove this spurious dependency in the
> next iteration of the patch.

Excellent, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
