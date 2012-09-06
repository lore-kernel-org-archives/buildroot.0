From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Sep 2012 16:34:40 +0200
Subject: [Buildroot] Python running very slow with buildroot 2012.05
In-Reply-To: <1346941637.60509.YahooMailNeo@web110712.mail.gq1.yahoo.com>
References: <1346940241.6846.YahooMailNeo@web110707.mail.gq1.yahoo.com>
 <20120906161509.2f5fc914@skate>
 <1346941637.60509.YahooMailNeo@web110712.mail.gq1.yahoo.com>
Message-ID: <20120906163440.69c585eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 6 Sep 2012 07:27:17 -0700 (PDT),
Vimal Menon <vimalmenon@yahoo.com> a ?crit :

> I checked using default installations in both the environments, can

What do you mean by this? You're comparing the Python that has been
built by your distro with a certain compiler and certain optimization
flags, with the Python that has been built by Buildroot using a
different compiler, with different optimization flags.

> the difference between glibc and uClibc be so huge for python?

I don't know. Maybe the dynamic linker is slower, maybe some other
parts of the C library are slower, but I'm not sure, it needs
investigation.

Is is reproducible even after the first run? Are you running the same
kernel, with the same configuration? Your two environments are really
different, so it's very difficult to make correct comparisons and draw
conclusions from them.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
