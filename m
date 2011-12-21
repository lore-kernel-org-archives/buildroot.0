From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2011 09:13:37 +0100
Subject: [Buildroot] [PATCH v3 2/2] New package: python-dpkt
In-Reply-To: <201112210754.28934.arnout@mind.be>
References: <1323877116-31436-1-git-send-email-yegorslists@googlemail.com>
 <201112210754.28934.arnout@mind.be>
Message-ID: <20111221091337.1d310b75@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Dec 2011 07:54:28 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> Alternatively, the information could be passed in environment variables
> which are set in the .mk file.

Yerk, no. This patch has to go upstream: it's silly for the setup.py
script of a Python module to require this Python module to already be
installed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
