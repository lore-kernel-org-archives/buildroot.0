From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jun 2012 15:06:31 +0200
Subject: [Buildroot] Compiling grub on x86_64
In-Reply-To: <4FEC5196.5070900@mind.be>
References: <4FE81898.4020606@mind.be> <20120625100458.4a3e62c8@skate>
 <4FEC1155.4020008@mind.be> <20120628114631.25da4786@skate>
 <20120628115613.7b4f26ad@skate> <4FEC5196.5070900@mind.be>
Message-ID: <20120628150631.7d062d58@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 28 Jun 2012 14:44:06 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   I was thinking along those lines as well.  I'll take a look at it but it may
> take some time.

I had a 5 minutes look, and it seems not to be very easy: while the
compilation of Grub should probably work without these companion
libraries, all the checks in the ./configure script assumes that a
working gcc -m32 compiler is available.

Also, is it worth spending so much time on Grub 0.97, now that Grub 2.0
has been (finally) released?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
