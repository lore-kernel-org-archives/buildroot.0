From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Sep 2012 10:09:12 +0200
Subject: [Buildroot] [PATCHv3 1/4] pkgconf: new package
In-Reply-To: <50640642.8020407@mind.be>
References: <1348656857-27725-1-git-send-email-gustavo@zacarias.com.ar>
 <50640642.8020407@mind.be>
Message-ID: <20120927100912.6b623e39@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 27 Sep 2012 09:54:42 +0200, Arnout Vandecappelle wrote:

> (on 750 packages, with the external sourcery toolchain for x86_64,
> excluding the 30-ish packages that didn't build before; took a bit of
> time to find a working allpackageyesconfig). I don't suppose I have
> to retest with this series?

Just curious, how long does it take to build the whole thing?

Would be good to fix those 30-ish packages that don't build, but I
guess some of them are due to the host tuple not being different
(waiting for your <arch>-buildroot-linux... to be merged).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
