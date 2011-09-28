From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Sep 2011 15:55:16 +0200
Subject: [Buildroot] add fcgi-2.4.0 package to buildroot
In-Reply-To: <op.v2itepap705kjs@rico>
References: <000301cc7486$0778f8f0$166aead0$@com>
 <20110916184409.2b4f53ae@skate>
 <001601cc76d6$7c3d1ac0$74b75040$@com>
 <20110919224628.173080cd@skate> <op.v15jbakh705kjs@rico>
 <op.v2ij9pax705kjs@rico> <20110928141624.2136b1e2@skate>
 <op.v2itepap705kjs@rico>
Message-ID: <20110928155516.3bbd08ec@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 28 Sep 2011 15:36:15 +0200,
"Rico Bachmann" <bachmann@tofwerk.com> a ?crit :

> after I did this cmd:
> 
>   git format-patch HEAD

That line is wrong, you should do:

	git format-patch master

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
