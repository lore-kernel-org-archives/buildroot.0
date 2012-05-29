From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 May 2012 23:01:23 +0200
Subject: [Buildroot] [PATCH] quota: new package (v2)
In-Reply-To: <1338324748-27437-1-git-send-email-jarkko.sakkinen@intel.com>
References: <1338324748-27437-1-git-send-email-jarkko.sakkinen@intel.com>
Message-ID: <20120529230123.35f2116f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 29 May 2012 23:52:28 +0300,
Jarkko Sakkinen <jarkko.sakkinen@intel.com> a ?crit :

>  fs/skeleton/etc/network/interfaces |    2 ++

Why do you need to change this file? The change is specific to the fact
of having an eth0 interface configured using dhcp, which may not be
necessarily the case. Can you justify why such a change is needed for
this new quota package?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
