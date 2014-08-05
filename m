From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Aug 2014 12:24:05 +0200
Subject: [Buildroot] [PATCH 1/1] espeak: bump to version 1.48.04 +
 depends on threads
In-Reply-To: <1407233304-19400-1-git-send-email-arnaud@intelibre.fr>
References: <1407233304-19400-1-git-send-email-arnaud@intelibre.fr>
Message-ID: <20140805122405.63fd69bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnaud,

On Tue,  5 Aug 2014 12:08:24 +0200, arnaud at intelibre.fr wrote:
> From: Arnaud Aujon <arnaud@intelibre.fr>
> 
> * Bump to new upstream version 1.48.04
> * Add depends on threads, fixes autobuild failure :
>  http://autobuild.buildroot.org/results/f39/f3903d2b4a16226df2d460dcd2e26c7fb87613ab

This should normally be two separate patches, because the thread
dependency is already here with the current version of espeak packaged
in Buildroot, so it's not related to the bump.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
