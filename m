From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 7 May 2014 11:04:04 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140507093155.18034c1d@free-electrons.com>
References: <20140507063009.23A95100E55@stock.ovh.net>,
 <20140507093155.18034c1d@free-electrons.com>
Message-ID: <trinity-2dbcf4e8-0f89-41ea-a300-89bf6b96ecb0-1399453444810@3capp-gmx-bs21>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Mittwoch, 07. Mai 2014 um 09:31 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: buildroot at uclibc.org, "Ezequiel Garcia" <ezequiel.garcia@free-electrons.com>, "Peter Seiderer" <ps.report@gmx.net>
> Betreff: Analysis of build failures
>
> Hello all,
> 

[...]

> >     x86_64 |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/992c17e43664e8f2dfdfe711c1b0a43ebc21af90/
> >   mips64el |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/2bbc9606281f4c96a264c5e1daa50f7957315047/
> >    powerpc |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/0162d66ddbfe7f240819eaee9e76bbd0a0ad7e7f/
> >       sh4a |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/d1f2083608540e9b7f778a25d54b94bdb582eca1/
> 
> Peter (Seiderer), could have a look at these? This issue has been
> hitting the autobuilders since many days, we really need to get it
> fixed.
> 

should be fixed by proposed patch
http://lists.busybox.net/pipermail/buildroot/2014-April/094830.html

Regards,
Peter
