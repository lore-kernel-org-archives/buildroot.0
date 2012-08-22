From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 19:47:10 +0200
Subject: [Buildroot] Compiling process
In-Reply-To: <1345630715.32281.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1345630715.32281.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <20120822194710.14807341@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 03:18:35 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> Can someone tell me through an example?what compiler line 
> should look like for compiling SomeFile.c (or .cpp) using compiler, 
> built by Buildroot. 

Use the compiler in output/host/usr/bin/<arch>-gcc.

> Also, does Qt need building X server, or it run independently of it ?

No, it can run directly on the framebuffer.

> Does some window manager have to be installed??

For a simple full screen application, just run your Qt application with
-qws as others mentioned.

If you want to build your Qt application with qmake, then use the qmake
installed in output/host/usr/bin/qmake.

I should probably put together a step-by-step tutorial on how to use
Buildroot to write Qt apps, as this sounds like a popular request.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
