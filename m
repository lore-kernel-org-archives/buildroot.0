From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 May 2012 11:58:44 +0200
Subject: [Buildroot] [PATCH] pkg-infra: remove the call from XXXTARGETS
In-Reply-To: <4FB0C31D.9080101@mind.be>
References: <1336857045-10679-1-git-send-email-arnout@mind.be>
 <20120514095846.7d206d16@skate> <4FB0C31D.9080101@mind.be>
Message-ID: <20120514115844.3631e856@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 14 May 2012 10:32:29 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   autotools-package / host-autotools-package
>   generic-package / host-generic-package
>   cmake-package / host-cmake-package

I'm fine with those. But then, maybe we need to rename
pkg-cmaketargets.mk to something like pkg-cmake.mk or another idea
(because the "targets" part of the name would no longer make much
sense).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
