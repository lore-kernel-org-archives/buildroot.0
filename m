From: Anmol Sarma <unmole.in@gmail.com>
Date: Thu, 2 Jan 2014 16:51:25 +0530
Subject: [Buildroot] Generating Buildroot compatible kernel tarball from Git
Message-ID: <CAP0ktjJR9UYxM2RuHUgTMWYu7vx2+V-yN31uhScLT53oZAYt4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to modify the default configuration for beaglebone to use a
custom tarball instead of a Git tree. I generated a tarball using:

git archive bb | bzip2 > linux-3.8.13.tar.bz2
-- 
Anmol Sarma
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140102/08601724/attachment-0001.html>
