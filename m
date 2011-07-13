From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jul 2011 16:14:51 +0200
Subject: [Buildroot] how BR download the linux kernel now
In-Reply-To: <CAAa76NTwjrB-6jbenSbGDpN0evxnV-TVx36DvdNcvWnVQEfr4w@mail.gmail.com>
References: <CAAa76NTwjrB-6jbenSbGDpN0evxnV-TVx36DvdNcvWnVQEfr4w@mail.gmail.com>
Message-ID: <20110713161451.791f42ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 13 Jul 2011 09:31:10 -0400,
raymond zhao <raymond.zhao.ml@gmail.com> a ?crit :

> That's great. I will definitely check it. If we solved this problem. I
> believe BR will be #1 choice for most embedded linux projects.

Thanks. I indeed think that this feature would be a really nice
addition to Buildroot. I miss it in many of the projects for which I
use Buildroot.

For the moment, my workaround is to not use Buildroot to build the part
of the system I'm actively working on. When I'm doing kernel
development, I build the kernel outside of Buildroot. When I develop an
application, I build the application outside of Buildroot. Buildroot is
here to build all the rest, and to provide a reproducible mechanism to
build the final system image.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
