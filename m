From: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
Date: Sun, 18 Nov 2012 10:57:54 +0100
Subject: [Buildroot] [PATCH] boost: bump to version 1.52.0
Message-ID: <50A8B122.1090203@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can someone review the patch to bump boost version before releasing next 
buildroot RC?

The patch is available in buildroot's patchwork at 
http://patchwork.ozlabs.org/patch/197508/

To bump boost, I needed to add dependance on BR2_LARGEFILE and exclude 
the new context lib, because this last fails during compilation : an 
include is missing and uintptr_t is not found. I will open a ticket on 
boost's bug tracker.
