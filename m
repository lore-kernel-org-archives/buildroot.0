From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Tue, 30 Dec 2014 04:06:12 +0000
Subject: [Buildroot] Need HDF5 Package for buildroot
Message-ID: <938dd60bbeb74a7ba18f7a54eb215760@exch13-mail06.win.slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I am using "buildroot-2014.11" with the uclibc toolchain for  "x86" and "x86_64" targets.

I do notice the packages along with the configuration files :)

I have also looked at the documentation on how to add a new package.

So, I am not re-inventing the wheel; does anyone already have package configs for the following:
I need to have hdf5 support on my target.  hdf5 depends on both szip and zlib.

=========================================================================
(1) HDF5
Version:     HDF5-1.8.14
URL:          http://www.hdfgroup.org/HDF5/release/obtainsrc.html
Download:  http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.14.tar.gz

(2) SZIP
Version:       szip-2.1
Download:    http://www.hdfgroup.org/ftp/lib-external/szip/2.1/src/szip-2.1.tar.gz

(3) ZLIB   {Already provided by buildroot; yahoo :) }
Version:       zlib-1.2.8
URL:            http://www.zlib.net
Download:    http://zlib.net/zlib-1.2.8.tar.gz
=========================================================================

Thanks in advance

Cheers,
Ernesto
