From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 7 Sep 2010 20:41:03 +0000 (UTC)
Subject: [Buildroot] OT: how to do upgrades with ipkg?
Message-ID: <i6680v$ahj$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First, my apologies.  This isn't directly related to buildroot, but
I'm hoping somebody might know the answer (there doesn't seem to be an
ipkg mailing list).

When using ipkg to manage field-installed pacakges, how do you upgrade
a package?  For example, let's say I've got foobar version 0.1
installed.  Now I have foobar_0.2_arm.ipk at hand on the target.  How
do I upgrade?

The "ipkg upgrade" command doesn't seem relevent -- it won't accept a
path to an .ipk file.  There are no "feeds" in my system.  All packages
are explicitly uploaded to the target and installed.

Do you just do this?

  ipkg remove foobar
  ipkg install foobar_0.2_arm.ipk

-- 
Grant Edwards               grant.b.edwards        Yow! It's a hole all the
                                  at               way to downtown Burbank!
                              gmail.com            
