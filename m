From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 15 Mar 2012 13:51:04 -0700
Subject: [Buildroot] not quite out of the woods
Message-ID: <CALo-6+gc0yqMrCee1VJrPbw5LGfGOcwbVERPtm3UvGGSwH3ZgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In working through my vsftpd.conf issue, I checked files into svn, did
an update, clean build and loaded onto the MPC8321 target.

But, .... now the files in /etc are now owned by "default" of the
group "default" and not owned by "root" of the group "root".

Is there somewhere in device_table.txt or some other file that I need
to change to ensure the owner and group of files added to /etc in
skeleton are correct?

-- 
Charles Krinke
