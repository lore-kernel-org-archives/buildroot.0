From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Mar 2012 15:27:39 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-03-28
In-Reply-To: <20120329111216.GW444@game.jcrosoft.org>
References: <20120329063012.3B50352C13D@lolut.humanoidz.org>
 <20120329111216.GW444@game.jcrosoft.org>
Message-ID: <20120329152739.4aa1ac55@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 29 Mar 2012 13:12:16 +0200,
Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :

> 	can you public the tool too

The web interface part (composed of ugly PHP code) is already available
publicly at http://git.buildroot.net/buildroot-test/.

The part that runs on the build servers has not yet been integrated
yet. Peter and myself run different scripts to do the builds, they
simply generate a tarball in a common format that is uploaded on this
web interface.

In the near future, I will clean up my own build scripts and integrate
them in the Git repository so that we can gradually improve them and
make them useful for others as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
