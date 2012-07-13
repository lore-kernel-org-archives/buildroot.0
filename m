From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 22:48:15 +0200
Subject: [Buildroot] [PATCH v3] libmad: Add optimization config options
In-Reply-To: <1591143229.1340033.1342210445309.JavaMail.root@advansee.com>
References: <17811032.1339793.1342209079006.JavaMail.root@advansee.com>
 <1591143229.1340033.1342210445309.JavaMail.root@advansee.com>
Message-ID: <20120713224815.563f916a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 13 Jul 2012 22:14:05 +0200 (CEST),
Beno?t Th?baudeau <benoit.thebaudeau@advansee.com> a ?crit :

> Configuring libmad with --enable-speed compromises accuracy and can cause audio
> clipping in some cases (heard on ARM platform with some loud MP3s), so give
> users the choice of MAD optimizations.
> 
> The default config corresponds to the default behavior of libmad's configure.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
