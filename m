From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 May 2017 16:01:33 +0200
Subject: [Buildroot] tried to add ethtool now get config error - Working
 zlib library and headers not found
In-Reply-To: <1495574614309-165534.post@n4.nabble.com>
References: <1495574614309-165534.post@n4.nabble.com>
Message-ID: <20170524160133.73c8229a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 May 2017 14:23:34 -0700 (PDT), lemonoje wrote:

> After successfully building and using my BR rootfs on my target Arria 10 SoC
> kit, I am trying to simply rebuild with enabling of the ethtool utility.  I
> get the following error trying to rebuild now, whether I have ethtool
> enabled or not, so that is very confusing as nothing else should have
> changed.  Any ideas on the cause?  It compiles everything else fine up to
> this point.

Do a full rebuild: "make clean all". If you can reproduce the problem,
then post your complete Buildroot .config file.

Also, make sure you read
https://buildroot.org/downloads/manual/manual.html#full-rebuild.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
