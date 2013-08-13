From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Aug 2013 00:22:50 +0200
Subject: [Buildroot] [PATCH] package: add the duma memory debugging
 library
In-Reply-To: <069B5A25F9844945B625ADE7258AC94C064D8477@4rf-nz-orion.local.4rf.com>
References: <069B5A25F9844945B625ADE7258AC94C061E77EA@4rf-nz-orion.local.4rf.com>
 <20130813225918.5f27ce9b@skate>
 <069B5A25F9844945B625ADE7258AC94C064D8477@4rf-nz-orion.local.4rf.com>
Message-ID: <20130814002250.1b8196fe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Reuben Dowle,

On Tue, 13 Aug 2013 22:15:34 +0000, Reuben Dowle wrote:

> To get duma compiling I just copied the patches that crosstool-ng was using verbatim. My toolchain supports c++, so this is not of any interest to me.

Ok. Then for some reason, those patches didn't seem to be sufficient
here. Anyway, if you don't care about non-C++ support, that's fine.
We'll leave that work for the unlikely contributor who really wants to
use duma in a non-C++ environment.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
