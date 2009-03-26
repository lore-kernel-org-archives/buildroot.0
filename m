From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Mar 2009 17:48:48 +0100
Subject: [Buildroot] Bug while autoreconfiguring tslib
Message-ID: <20090326174848.4b1db278@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

While autoreconfiguring tslib, issue :

>>> tslib 1.0 Running autoreconf
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: /home/thomas/local/buildroot/build_arm/host_dir/usr/bin/aclocal -I /home/thomas/local/buildroot/build_arm/staging_dir/usr/share/aclocal --force -I m4/internal -I m4/external
aclocal: couldn't open directory `/home/thomas/local/buildroot/build_arm/staging_dir/usr/share/aclocal': No such file or directory
autoreconf: /home/thomas/local/buildroot/build_arm/host_dir/usr/bin/aclocal failed with exit status: 1
make: ***
[/home/thomas/local/buildroot/build_arm/tslib-1.0/.stamp_autoconfigured]
Error 1

.config file included.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 16091 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090326/ab78ce1e/attachment-0001.obj>
