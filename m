From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Sep 2012 11:23:02 +0200
Subject: [Buildroot] [PATCH 3/4] Remove target/Makefile.in, now useless
In-Reply-To: <201209042324.32810.yann.morin.1998@free.fr>
References: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
 <77bb15266ba4c2bad35d207606a0214fef441263.1346767209.git.thomas.petazzoni@free-electrons.com>
 <201209042324.32810.yann.morin.1998@free.fr>
Message-ID: <20120905112302.33add030@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 4 Sep 2012 23:24:32 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> I would fold this patch with the previous one. Without it, the previous
> patch breaks the Makefile:
>   $ make defconfig
>   [--SNIP--]
>   $ make
>   target/Makefile.in:2: target/generic/Makefile.in: No such file or directory
>   make: *** No rule to make target `target/generic/Makefile.in'.  Stop.
> 
> (Sorry, I missed that in the previous patch).

Ok, will do.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
