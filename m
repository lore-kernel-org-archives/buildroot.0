From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 12:43:49 +0200
Subject: [Buildroot] [PATCH] gpsd: Fix lacking simplejson module error
 at build
In-Reply-To: <1345795169-20220-1-git-send-email-maxime.ripard@free-electrons.com>
References: <20120822200615.42118e87@skate>
 <1345795169-20220-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20120824124349.2b2aaf9a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 24 Aug 2012 09:59:29 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> Would something like this make more sense to you ?

Yes, this looks good. Long term, we will just deprecate the support for
Python 2.5 as the host Python, but in the mean time, this looks like
the easiest fix.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
