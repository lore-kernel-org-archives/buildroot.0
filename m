From: Ormund Williams <ormundw@panix.com>
Date: Mon, 11 Aug 2008 11:08:23 -0400
Subject: [Buildroot] Building Cairo using DirectFB
Message-ID: <1218467304.18656.19.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

It seems that DirectFB puts its header files in:
	..staging_dir/usr/include/directfb/
but Cairo is looking for them in:
	..staging_dir/include/directfb/

Actually, ..staging_dir/include/ doesn't exist, so how do I get Cairo to
look in the right place?

__
Ormund
