From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2008 09:32:51 +0100
Subject: [Buildroot] Autoreconf is using host tools
In-Reply-To: <20081210093048.175f7964@surf>
References: <20081210093048.175f7964@surf>
Message-ID: <20081211093251.047feec6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 10 Dec 2008 09:30:48 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> The problem is that it tries to use "libtoolize" of my host (Ubuntu
> system) and not the host-libtool that was compiled by Buildroot and
> installed in $(STAGING_DIR). I don't really get how all this
> AUTORECONF stuff works, so I don't know how it selects the tools.

Any clue ? Does it work for everybody else ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
