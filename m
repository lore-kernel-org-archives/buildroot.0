From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 12:35:22 +0200
Subject: [Buildroot] [PATCH] sysprof: New package.
In-Reply-To: <CAFbHwiQTT6rojCNvBNSUYierq5mrOkMmQfC95yxz1vK4gocCNA@mail.gmail.com>
References: <CAFbHwiTWnB+EtB=Du5bkAa7mtKfJ7nHeyWGshpq7Rcvjf9O__g@mail.gmail.com>
 <20120730235830.27770869@skate> <20120731110420.76490dd1@skate>
 <CAFbHwiQTT6rojCNvBNSUYierq5mrOkMmQfC95yxz1vK4gocCNA@mail.gmail.com>
Message-ID: <20120731123522.501dae00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 31 Jul 2012 11:31:20 +0100,
Will Newton <will.newton@gmail.com> a ?crit :

> Would something like the below be acceptable? It's not very clean but
> until uClibc supports this define I don't know if there is a better
> alternative.

It's similar to
http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch,
so I guess it's acceptable. The perf people are also doing the same
thing apparently.

Thanks, I will commit this!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
