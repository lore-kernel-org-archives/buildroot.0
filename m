From: lolo tremolo <lolotremolo@gmail.com>
Date: Fri, 12 Jul 2013 15:59:40 +0200
Subject: [Buildroot] beaglebone using default beaglebone_defconfig
 (error: busybox_unstripped uses VFP register arguments... ...does not), 
In-Reply-To: <1373594780.95510.YahooMailNeo@web162606.mail.bf1.yahoo.com>
References: <CAJG6REzrBV_wR3-Wa5nrnfOn6r=Q_UERjFfyRpLBdd_44_e-Bw@mail.gmail.com>
 <1373594780.95510.YahooMailNeo@web162606.mail.bf1.yahoo.com>
Message-ID: <CAJG6RExzH1hZX1xqPgW=ANCTJoAcNCnB5pYn5To-y1JYDJRezw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thanks a lot, I did not pay attention to the fact that there is a stable
version.
I can continue my experimentations.
thanks


2013/7/12 Tim michals <tcmichals@yahoo.com>

>
> >hello, my only experience with buildroot is my successful test with
> raspberry last week after reading an article of Pierre Ficheux. i 'm a
> >newbie and i'm not sure what i say.
>
> >it seems there is a problem with the beaglebone. I tried to change
> options to the beaglebone_defconfig but I do not succeed.
>
> >suddenly I prefer to show you the problem with the default config.
>
> >$ git clone git://git.buildroot.net/buildroot
> >$ cd buildroot
> >$ make beaglebone_defconfig
> >$ make
>
> try the stable version 2013.05 from the download page, looks like the
> version has an issue with the tools....
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130712/c6578699/attachment.html>
