From: Steve Kenton <skenton@ou.edu>
Date: Sat, 17 Jan 2015 22:23:20 -0600
Subject: [Buildroot] [PATCH V2] dvd+rw-tools: new package
In-Reply-To: <XnsA425C51B017E9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <54B9B774.9030204@ou.edu>
 <XnsA425C51B017E9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <54BB3538.6050206@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> according to Beyond Linux From Scratch you need libisoburn or a similar 
> package which provides xorrisofs, otherwise "the growisofs command will not 
> function properly"
> http://www.linuxfromscratch.org/blfs/view/svn/multimedia/dvd-rw-tools.html

I look at the LFS information again and it brings up another points. Linux From
Scratch patches dvd+rw-tools to replace mkisofs from the cdrtools package
with xorrisofs from GNU xorriso.

I have also been experimenting with the cdrtools 3.01 pre-release package.
The controversy about whether the CDDL license is GPL compatible is beyond
me. Would the buildroot project be likely to accept a cdrtools submission
or should I also patch dvd+rw-tools to to use the xorriso equivalents to the
cdrtools programs? I missed that and need to do one or the other I guess.

FYI xorriso does not do UDF and cdrtools apparently does.

Steve
