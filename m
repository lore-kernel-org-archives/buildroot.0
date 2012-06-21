From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jun 2012 23:53:23 +0200
Subject: [Buildroot] [PATCH] sudo: fix install
In-Reply-To: <4FE38000.4000107@mind.be>
References: <1340268304-26103-1-git-send-email-spdawson@gmail.com>
 <4FE38000.4000107@mind.be>
Message-ID: <20120621235323.4b0d5ebd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 21 Jun 2012 22:11:44 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   Nice work, Simon!  I especially like the very extensive comment in the
> patch header.

Yes, thanks a lot for this work, and your persistence in getting this
done properly!

>   It's a pity that upstream decided to add the cross_compiling assignment to
> all these Makefile.in where it isn't actually used, but that's their choice...

Well, once it will be in a released version, we'll discard the patch
and we'll no longer notice this :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
