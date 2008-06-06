From: Christopher Taylor <chtaylo3@gmail.com>
Date: Fri, 6 Jun 2008 15:16:19 -0400
Subject: [Buildroot] Working around gcc vfp/fpa errors
Message-ID: <2590773a0806061216t45b4d02and339aff031ba857b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It appears that the same buildroot configuration for soft floats does
not get you similiar results with different versions of gcc.  Please
see my post on the uclibc mailing list starting here:
http://www.uclibc.org/lists/uclibc/2008-June/019476.html .  The last
(and most meaningful) msgs I sent on this thread was at approx
1450EST06JUNE2008.  It probably hasn't hit the archive as of this
posting, YMMV.

Is this perhaps something buildroot could be more explicit about and
if so, would you accept a patch if I was to work one out?

-Chris
