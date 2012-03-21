From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 10:13:27 +0100
Subject: [Buildroot] Random build results now available online
Message-ID: <20120321101327.49d34f93@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

During the Prague and Brussels last Buildroot meetings, we discussed
the idea of putting online the results of the random configurations
build that Peter and myself were doing.

This week-end, I want ahead and implemented something. The results of
both Peter builds and my builds are now visible online at:

 http://buildroot.humanoidz.org/

Builds are running 24/7 on several machines (one build server of Free
Electrons, and multiple machines of the gcc farm), and all results are
visible online. For each result, one can see:

 * the result (OK or NOK)
 * the Git commit id identifying which Buildroot version was used. The
   build machines are updating their version before every build
 * which architecture was targeted
 * which package is failing
 * which machine was used for the build
 * the 100 last lines of the build log (faster than having to download
   the entire build log)
 * the entire build log compressed
 * the Buildroot configuration

In the following days, I will:

 * Put online the source code of the web interface. It consists of a
   bit of crappy PHP code, but I'll put it online in a Git repository
   so that everyone can contribute to its improvement.

 * Put online a documentation that details how other people can
   contribute build results (it's basically a matter of creating a
   tarball with some particular files, and uploading this tarball over
   http)

The website along with all build results are currently hosted on a
personal server. If there a wish to migrate this on a more common
server, I'll be happy to do so, provided that this server has the
necessary ressources (dependencies and disk space).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
