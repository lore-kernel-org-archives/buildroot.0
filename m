From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jul 2013 10:27:32 +0200
Subject: [Buildroot] How to rebuild root filesystem?
In-Reply-To: <20130708045657.GA29211@zuhnb712.ap.bm.net>
References: <20130708045657.GA29211@zuhnb712.ap.bm.net>
Message-ID: <20130708102732.46a8b87d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Mon, 8 Jul 2013 12:56:58 +0800, Woody Wu wrote:

> Since things in my output/target got messed, hence I want to rebuild
> everything in that directory and recreate the root filesystem image. How
> can I ask buildroot to do it?
> 
> I knew that 'make clean' and 'make' will do it. But, my external
> toolchain also get rebuilt, that can take very long time.

No, if you're using an external toolchain, it does *not* gets rebuilt
every time you do make clean && make. It's the whole point of using an
external toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
