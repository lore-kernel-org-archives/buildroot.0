From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2011 16:22:23 +0200
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20111018162223.34c2adc1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 18 Oct 2011 11:14:54 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Add FOO_MIRROR support for packages that have different URLs to fetch
> from, for redundancy or when they move to an obsolete/old directory
> when a new version pops up.
> Only implement for WGET methods.

Just wondering: what about making <pkg>_SITE a space-separated list of
URLs to try, instead of adding <pkg>_MIRROR ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
