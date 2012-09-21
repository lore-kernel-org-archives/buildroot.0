From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 14:03:00 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
 host-pkg-config
In-Reply-To: <505C4969.8090707@zacarias.com.ar>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar>
Message-ID: <20120921140300.207eea98@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 21 Sep 2012 08:03:05 -0300, Gustavo Zacarias wrote:

> Because it uses any pkg-config around, it doesn't honour PKG_CONFIG nor
> check for it as a dependency.

My autobuild stuff runs inside a chroot that does not have pkg-config
installed. The chroot in question has the strict minimal number of
dependencies that Buildroot requires on the host system.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
