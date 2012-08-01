From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Aug 2012 10:03:05 +0200
Subject: [Buildroot] [PATCH] sysprof: New package.
In-Reply-To: <CAFbHwiQTT6rojCNvBNSUYierq5mrOkMmQfC95yxz1vK4gocCNA@mail.gmail.com>
References: <CAFbHwiTWnB+EtB=Du5bkAa7mtKfJ7nHeyWGshpq7Rcvjf9O__g@mail.gmail.com>
 <20120730235830.27770869@skate> <20120731110420.76490dd1@skate>
 <CAFbHwiQTT6rojCNvBNSUYierq5mrOkMmQfC95yxz1vK4gocCNA@mail.gmail.com>
Message-ID: <20120801100305.1afec3c1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 31 Jul 2012 11:31:20 +0100,
Will Newton <will.newton@gmail.com> a ?crit :

> > It has been causing quite a few build failures since I merged the
> > package, so it would be good to fix those.
> 
> Would something like the below be acceptable? It's not very clean but
> until uClibc supports this define I don't know if there is a better
> alternative.

I've pushed your patch. It solves the build failure on x86, and removes
one error message from the PowerPC build, but the PowerPC build is still
failing:
http://autobuild.buildroot.org/results/a3ef351704317a9f3f3ab4ee3845bc1e61938c23/build-end.log.

It has caused ~5 build failures during the last night.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
