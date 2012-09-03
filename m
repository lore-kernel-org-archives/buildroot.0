From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Sep 2012 22:01:43 +0200
Subject: [Buildroot] Bash string manipulation in Kconfig
In-Reply-To: <50450AD0.3060703@petroprogram.com>
References: <5044FD5F.102@petroprogram.com> <20120903210830.71b3372b@skate>
 <50450AD0.3060703@petroprogram.com>
Message-ID: <20120903220143.42e0c095@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 03 Sep 2012 22:53:52 +0300,
Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :

> for i in $(FULL_DOWNLOAD_URL);do \
>     echo $(notdir $$i) ; \

Inside this for loop, what you're writing is shell code, not make code.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
