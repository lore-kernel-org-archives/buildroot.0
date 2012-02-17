From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Feb 2012 16:36:55 +0100
Subject: [Buildroot] cross compile when crosstool-ng selected
In-Reply-To: <CAPeX=+tg50C7qu67exCpn+S0zXGnY=5BQTb4QbSc5S0xHga4bw@mail.gmail.com>
References: <CAPeX=+vkZe-E9_VVG_VGZw3dgcBBNNszC_UWyOU67YVHhSaj8A@mail.gmail.com>
 <20120217071310.GC3119@tarshish>
 <CAPeX=+tg50C7qu67exCpn+S0zXGnY=5BQTb4QbSc5S0xHga4bw@mail.gmail.com>
Message-ID: <20120217163655.6e1206ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 17 Feb 2012 11:06:11 +0200,
Ozgun <ozgun.gunay@gmail.com> a ?crit :

> I guess Crosstol-NG generated cross compiler is located under
> /output/host/usr
> I want to compile and install the
> qtquick3d-tp2-src.tar.gz<ftp://ftp.qt.nokia.com/qt3d/noarch/current/qtquick3d-tp2-src.tar.gz>to
> the target.
> How can I do this?

Two ways:

 *) Cross-compile it manually using the cross-compiler available in
    output/host/usr/bin

 *) Or, easier and better, create a Buildroot package for it. Look at
    the Buildroot documentation for details on how to create a package.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
