From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 9 May 2019 08:55:43 -0500
Subject: [Buildroot] Fwd: [autobuild.buildroot.net] Your build results for
 2019-05-08
In-Reply-To: <20190509060040.D56B7604B6@crulimr01.rockwellcollins.com>
References: <20190509060040.D56B7604B6@crulimr01.rockwellcollins.com>
Message-ID: <CAMQcK5J5YUv4nYfdFpZhRnO6uy+5i6Rpnxa6nGXcZNQDTA3zGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter and Thomas,

Looks like the recent bump on aftp is causing issues with the
autobuilders and downloading the new file. From both logs:

>>> atftp 0.7.2 Downloading [27m
--2019-05-08 14:47:03--
http://sourceforge.net/projects/atftp/files/atftp-0.7.2.tar.gz
Resolving sourceforge.net (sourceforge.net)... 216.105.38.13
Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/atftp/files/atftp-0.7.2.tar.gz
[following]
--2019-05-08 14:47:04--
https://sourceforge.net/projects/atftp/files/atftp-0.7.2.tar.gz
Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:443... connected.
GnuTLS: A TLS fatal alert has been received.
Unable to establish SSL connection.

These were both run on the autobuilder from Thomas so it may be a
build server configuration issue.

Thanks,
-Ryan

---------- Forwarded message ---------
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, May 9, 2019 at 1:00 AM
Subject: [autobuild.buildroot.net] Your build results for 2019-05-08
To: Ryan Barnett <ryan.barnett@rockwellcollins.com>


Hello,

This is the list of Buildroot build failures that occured on
2019-05-08, and for which you are a registered architecture developer
or package developer. Please help us improving the quality of
Buildroot by investigating those build failures and sending patches to
fix them. Thanks!

Results for the 'master' branch
===============================

Build failures related to your packages:

         arm |                    atftp-0.7.2 |
http://autobuild.buildroot.net/results/8606908b60fca430366d558a8e6db7a06ca08631
         arc |                    atftp-0.7.2 |
http://autobuild.buildroot.net/results/177a64fb419a6d4c2349970bce966819925e4de5

--
http://autobuild.buildroot.net
