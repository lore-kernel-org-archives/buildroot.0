From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2012 20:20:53 +0100
Subject: [Buildroot] [PATCH] Add package dstat (python script for system
 stats/profiling)
In-Reply-To: <ea9a2822083f7d79034f.1328561311@beantl019720>
References: <ea9a2822083f7d79034f.1328561311@beantl019720>
Message-ID: <20120207202053.2489076e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 06 Feb 2012 21:48:31 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> +$(eval $(call GENTARGETS,package,dstat))

$(eval $(call GENTARGETS)) is sufficient.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
