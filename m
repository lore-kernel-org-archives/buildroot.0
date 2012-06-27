From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jun 2012 16:35:16 +0200
Subject: [Buildroot] Avahi build failed with BR2_STRIP_none=y and
 BR2_ENABLE_DEBUG=n
In-Reply-To: <1340807345.3122.117.camel@jr-ThinkCentre-A57>
References: <1340800887.3122.113.camel@jr-ThinkCentre-A57>
 <1340807345.3122.117.camel@jr-ThinkCentre-A57>
Message-ID: <20120627163516.57518869@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 27 Jun 2012 16:29:05 +0200,
Joerg Rebenstorf <Joerg.Rebenstorf@GiN.de> a ?crit :

> If anybody knows an even more buildroot compliant way to fix the bug in
> this specific buildroot release I certainly would be interested to know.

The Buildroot compliant way would be to upgrade to a newer version. We
no longer use 'install-strip' since commit
55ade5c7964e15f9b1eba061ab840cc4c25e4e37 (September 2010).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
