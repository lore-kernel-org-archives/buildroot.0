From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2011 13:38:36 +0100
Subject: [Buildroot] [PATCH] New package: python-setuptools
In-Reply-To: <CAGm1_ktmRmH_V0zX+k3gkZ9HcwNH5YP16Lrx7BTUePGBcxED=A@mail.gmail.com>
References: <1324464775-9409-1-git-send-email-yegorslists@googlemail.com>
 <CAGm1_ktmRmH_V0zX+k3gkZ9HcwNH5YP16Lrx7BTUePGBcxED=A@mail.gmail.com>
Message-ID: <20111221133836.67497032@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Dec 2011 11:58:08 +0100,
Yegor Yefremov <yegorslists@googlemail.com> a ?crit :

> I have some questions regarding host packages. How do I tell BR to
> build it as host package?

You need to have another package that depends on host-python-setuptools.

> Do we need this package in staging and or target?

No. What you did looks good. Just create a package that depends on
host-python-setuptools.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
