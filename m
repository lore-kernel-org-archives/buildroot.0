From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Aug 2012 14:12:57 +0200
Subject: [Buildroot] [PATCH] Add support for the HABA-KNX-LITE
In-Reply-To: <503C68C1.7000503@calao-systems.com>
References: <503B97EC.1000705@calao-systems.com>
 <20120828024345.290a3aa0@skate>
 <503C68C1.7000503@calao-systems.com>
Message-ID: <20120828141257.7f1f0783@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Aug 2012 08:44:17 +0200,
gregory hermant <gregory.hermant@calao-systems.com> a ?crit :

> > Do you have plans to push the Barebox and Linux kernel parts
> > upstream?
> About barebox, we plan to push a patch as soon as the defaultenv-2
> will be ready.

Ok.

> For the kernel we are preparing a patch but for DT only.

Ok, so then this is upstream, please update this board support to use
the DT variant in Buildroot as well, and get rid of the kernel patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
