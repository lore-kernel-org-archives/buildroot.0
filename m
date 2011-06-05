From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jun 2011 21:23:50 +0200
Subject: [Buildroot] Packages Post-extract pre-patch phase ?
In-Reply-To: <1307284805.2767.10.camel@ceri>
References: <1307284805.2767.10.camel@ceri>
Message-ID: <20110605212350.17cff2fd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 05 Jun 2011 15:40:05 +0100,
Mike Davies <busybox_mail@rovoreed.com> a ?crit :

> Is it possible to have a "post extract" or "pre patch" phase ?

Yes, you have the <pkg>_POST_EXTRACT_HOOKS variable for each package,
which can contain a list of make macros to call after the package
extraction.

See package/dropbear/dropbear.mk for an example.

The documentation should be updated to reflect the availability of this
hook point. Would you volunteer to send a patch to update the
documentation ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
