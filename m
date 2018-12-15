From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 15 Dec 2018 22:29:23 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-14
In-Reply-To: <20181215070019.5B30D20CE3@mail.bootlin.com>
References: <20181215070019.5B30D20CE3@mail.bootlin.com>
Message-ID: <CAMRc=MckU2reCdyzJb1cvNKmL71=o1KWHwoOrSzLvXh1193Bvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sob., 15 gru 2018 o 08:00 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> napisa?(a):
>
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2018-12-14, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> ===============================
>
> Build failures related to your packages:
>
>          arm |                pulseview-0.4.1 | http://autobuild.buildroot.net/results/71c46fac3bd30c7d30ac89ce43e411a9772665bb
>
> --
> http://autobuild.buildroot.net

This is a different issue than the one I fixed before but I'm getting
the following error when trying to build with the provided config:

Makefile.legacy:9: *** "You have legacy configuration in your .config!
Please check your configuration.".  Stop.
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Bart
