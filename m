From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 22 Sep 2010 17:29:03 +0000 (UTC)
Subject: [Buildroot] Building fw_printenv (u-boot utility) for target?
Message-ID: <i7decv$4q1$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want fw_printenv on my target, and it would be convenient if
buildroot built it and set up the relvent links.  But, AFAICT, I can't
have buildroot build the fw_printenv utility without having it do a
complete build of U-Boot.  I don't have any need/desire for buildroot
to build the bootloader itself, I only need the fw_printenv linux app
for the target.  Is that possible with buildroot?

Or should I just build fw_printenv separately and stick it into the
filesystem using the custom package?

-- 
Grant Edwards               grant.b.edwards        Yow! Don't SANFORIZE me!!
                                  at               
                              gmail.com            
