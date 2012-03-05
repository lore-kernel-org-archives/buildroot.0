From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Mar 2012 10:45:32 +0100
Subject: [Buildroot] Using buildroot images (iso/ext2) in real target
 device (flash drive)
In-Reply-To: <201203022300.01500.arnout@mind.be>
References: <jio6ql$25v$1@dough.gmane.org> <20120301175921.5811b398@skate>
 <201203022300.01500.arnout@mind.be>
Message-ID: <20120305104532.69ae133b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 2 Mar 2012 23:00:01 +0000,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  It probably won't work if your target is uclibc-based (unless your host
> happens to be uclibc-based as well :-).

Correct. This code was taken from a project that was glibc-based.

> You'd need a host-grub to get that right.  I tried to do that half a year ago, but it wasn't so easy -
> unfortunately I don't remember why not.  Could be a problem with 32/64 bit.
> Or with ccache.

Yeah, I remember you posted some patches about this. Don't remember
what the outcome was, though. Definitely something that would be nice
to improve.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
