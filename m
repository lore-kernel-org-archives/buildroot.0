From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 09:19:18 +0200
Subject: [Buildroot] [PATCH] sysprof: New package.
In-Reply-To: <20120801100305.1afec3c1@skate>
References: <CAFbHwiTWnB+EtB=Du5bkAa7mtKfJ7nHeyWGshpq7Rcvjf9O__g@mail.gmail.com>
 <20120730235830.27770869@skate> <20120731110420.76490dd1@skate>
 <CAFbHwiQTT6rojCNvBNSUYierq5mrOkMmQfC95yxz1vK4gocCNA@mail.gmail.com>
 <20120801100305.1afec3c1@skate>
Message-ID: <20120802091918.72c6ac15@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 1 Aug 2012 10:03:05 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> I've pushed your patch. It solves the build failure on x86, and removes
> one error message from the PowerPC build, but the PowerPC build is still
> failing:
> http://autobuild.buildroot.org/results/a3ef351704317a9f3f3ab4ee3845bc1e61938c23/build-end.log.

I have pushed another patch (taken from upstream) that fixes this
problem, so no need to spend time on this one.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
