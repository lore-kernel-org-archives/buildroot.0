From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jul 2013 21:23:35 +0200
Subject: [Buildroot] [PATCH 1/3] qt{4,
 5}: add an explicit choice to express Buildroot does not support
 their coexistence
In-Reply-To: <CAHXCMMKx-vf9ZFRgzhj_bvYwbb2vHz3qQkC6ebgKqts_-v6-bA@mail.gmail.com>
References: <1373222695-9148-1-git-send-email-s.martin49@gmail.com>
 <CAHXCMMKx-vf9ZFRgzhj_bvYwbb2vHz3qQkC6ebgKqts_-v6-bA@mail.gmail.com>
Message-ID: <20130707212335.630a2d32@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 7 Jul 2013 21:08:25 +0200, Samuel Martin wrote:

> I forgot to mention that using an explicit choice allow to get rid of
> the dependency between the
> Qt4 and Qt5 packages.
> So, for packages supporting both Qt4 and Qt5 (like OpenCV), it makes
> possible to handle the
> right dependency with no circular/recursive dependency in the Config.in files.

Can you give more details about this circular/recursive dependency
problem?

I'm not too enthusiastic about your PATCH 1/3, so I'd like to be sure
to completely understand what the problem is, and look at the different
possible solutions.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
