From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Sep 2012 21:08:30 +0200
Subject: [Buildroot] Bash string manipulation in Kconfig
In-Reply-To: <5044FD5F.102@petroprogram.com>
References: <5044FD5F.102@petroprogram.com>
Message-ID: <20120903210830.71b3372b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 03 Sep 2012 21:56:31 +0300,
Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :

> But how to do similar in buildroot  .mk files ???

	$(notdir $(FOO))

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
