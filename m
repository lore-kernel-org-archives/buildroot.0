From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 04 May 2012 08:32:48 +0200
Subject: [Buildroot] Console login root needing a password
In-Reply-To: <20120504082228.4d637b6e@skate>
References: <CAG6aBkVA-XPByuGaxUdKQAfGrMq_X_DhVdWOfA2Zh+mUt2jq-w@mail.gmail.com>
 <4FA2298E.5000807@visionsystems.de>
 <CAG6aBkWE0X1fm9LatHE9V+c_kvqvpkYkxZzE+xzEiVcgX6LGwA@mail.gmail.com>
 <4FA27B9B.3080108@peavey-eu.com> <20120503154205.483441b5@skate>
 <CAG6aBkX9Rk_TuEJjS7qqG59nRvm9TYc=EK6+uj0nCHW7an6Phw@mail.gmail.com>
 <20120504082228.4d637b6e@skate>
Message-ID: <4FA37810.6040703@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 04.05.2012 08:22, schrieb Thomas Petazzoni:
> Le Thu, 3 May 2012 23:04:05 -0400,
> Nigel Sollars <nsollars@gmail.com> a ?crit :
> 
>> For this time around Yegor is the winner,  it dropped me to a shell
>> directly where I was able to set a root password, this allowed me to
>> ssh into the unit.
> 
> Well the thing is that you shouldn't have had to do that in the first
> place. Login should just work fine on the serial console.

With -/bin/sh was actually a tip from as Thomas as I needed to login to pty without a login. And as Thomas says you shouldn't have a problem with default image. Entering "root" as login and without a password is sufficient. After that you can execute passwd root.

Yegor
