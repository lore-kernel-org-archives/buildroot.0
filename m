From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 23 Nov 2015 19:22:18 +0000 (UTC)
Subject: [Buildroot] No 'zip' utility?
Message-ID: <n2vp1a$rde$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just stumbled across the fact that there doesn't seem to be a 'zip'
utility available either as a busybox applet or as a stand-alone
utility with a buildroot package.  I've got a web app running on an
ARM9 boad that allows users to PUT trees of files to my board in
either .zip or .tar.gz archives.  When it came time to add a feature
that required users to GET trees of files from my board, I agreed to
also support .zip format archives (dimly assuming that since there was
a zip, there would be an unzip).

But, though busybox has an 'unzip', it doesn't have a 'zip'.  And
there doesn't appear to be a stand-alone 'zip' package in buildroot.

Is it just that I'm the first one dumb enough to sign up for creating
.zip archives on an embedded linux system? Or is there some
licensing/patent reason why creation of the .zip archives is
unsupported?

-- 
Grant Edwards               grant.b.edwards        Yow! Can I have an IMPULSE
                                  at               ITEM instead?
                              gmail.com            
