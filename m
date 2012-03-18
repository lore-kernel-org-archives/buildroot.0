From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Mar 2012 16:56:19 +0100
Subject: [Buildroot] (no subject)
In-Reply-To: <201203181629.53542.arnout@mind.be>
References: <1531E53627F1F749B4FE809BF2A4EB67031019E4@WETMEX10.loepfe.com>
 <201203181629.53542.arnout@mind.be>
Message-ID: <20120318165619.15f7d3dc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 18 Mar 2012 16:29:53 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Ideally, you should revert everything to the working situation, and then
> upgrade the libraries one by one to find the one that is causing the
> problem.  Looking at the backtraces, if must be one of gdk, glib, or
> uClibc.

Testing against glibc may provide a good indication as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
