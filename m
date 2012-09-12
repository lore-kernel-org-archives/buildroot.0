From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Sep 2012 08:44:34 +0200
Subject: [Buildroot] big root fs
In-Reply-To: <1347427978.76430.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1347366592.32116.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120911154439.47e2b53a@skate>
 <1347427978.76430.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <20120912084434.13946c09@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 11 Sep 2012 22:32:58 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> So, as much as I understood, I can't expect to reduce jffs2 below
> let's say 45MB having included?options that?I stated (GTK, ...).
> Then a question emerged to me - how it happens that for example
> Qtopia for my ARM board has 25MB, alltogether with some 
> video materials, games, ...?
> Although I didn't try, but there is Angstrom root file system for my
> ARM board, based on glibc, that is 25MB at size, which is considerably 
> smaller then my jffs2.
> How did they achieve that, or maybe I made some mistakes so the
> file size is large ?

As Avery said, look around with du and ls in your filesystem to check
where the size is, and whether or not the biggest things are actually
useful or not.

Alternatively, could you put online a tarball version of your
filesystem, so that others could help you pointing what are the
problems?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
