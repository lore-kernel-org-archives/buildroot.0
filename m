From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2012 16:52:42 +0100
Subject: [Buildroot] opencv with glibc
In-Reply-To: <CAPeX=+tCiegGOeD2bi9+v8aOVrB=FjHo3XEAvp1b5tNfR85N-w@mail.gmail.com>
References: <CAPeX=+tCiegGOeD2bi9+v8aOVrB=FjHo3XEAvp1b5tNfR85N-w@mail.gmail.com>
Message-ID: <20120215165242.6af85108@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 15 Feb 2012 17:35:08 +0200,
Ozgun <ozgun.gunay@gmail.com> a ?crit :

> I'm using ct-ng toolchain and glibc library. when compiling opencv
> gives the following uclibc error;

Can you send your Buildroot .config file? According to your build log,
you are definitely not using a glibc toolchain, so there is probably a
problem in your Buildroot configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
