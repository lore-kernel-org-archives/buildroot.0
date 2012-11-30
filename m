From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 30 Nov 2012 19:31:13 +0100
Subject: [Buildroot] can-utils or site method git broken
Message-ID: <50B8FB71.4000309@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am currently trying to build can-utils without success. Obviously,
getting the required commit from gitorious.org fails. I verified that I
can clone the repo by hand and that it contains the right hash.

Configuration: beaglebone_defconfig, added can-utils, branch master from
today (82583bf4), Ubuntu 10.04 LTS.

Kind regards

Stephan
> >>> can-utils 836d3cc0122ce31a1b732d369cbd27b690c3110f Downloading
> Initialized empty Git repository in
> /home/stephan/Dokumente/dl/can-utils-836d3cc0122ce31a1b732d369cbd27b690c3110f/
> remote: Counting objects: 62, done.
> remote: Compressing objects: 100% (51/51), done.
> remote: Total 62 (delta 10), reused 22 (delta 0)
> Receiving objects: 100% (62/62), 100.37 KiB, done.
> Resolving deltas: 100% (10/10), done.
> warning: Remote branch 836d3cc0122ce31a1b732d369cbd27b690c3110f not
> found in upstream origin, using HEAD instead
> fatal: not a tree object
> >>> can-utils 836d3cc0122ce31a1b732d369cbd27b690c3110f Extracting
> gzip -d -c
> /home/stephan/Dokumente/dl/can-utils-836d3cc0122ce31a1b732d369cbd27b690c3110f.tar.gz
> | tar --strip-components=1 -C
> /home/stephan/Dokumente/BeagleBone/buildroot/output/build/can-utils-836d3cc0122ce31a1b732d369cbd27b690c3110f 
> -xf -
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
> make: ***
> [/home/stephan/Dokumente/BeagleBone/buildroot/output/build/can-utils-836d3cc0122ce31a1b732d369cbd27b690c3110f/.stamp_extracted]
> Error 2
-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
