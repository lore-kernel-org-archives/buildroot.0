From: Brian Beattie <beattie@beattie-home.net>
Date: Wed, 30 Jul 2008 22:47:10 -0700
Subject: [Buildroot] missing acl.h for host mtd-utils
Message-ID: <1217483230.6143.29.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think I have tracked this down, two of the missing include files and
the library were due to a missing package on my system, but I still
don't have an acl.h and I'm not sure where it would come from.  My
development system is Ubuntu.  If somebody knows what package contains
acl.h I'd appreciate hearing.  In the mean time I have worked around
this by copying the target acl patch to a host package.

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto
