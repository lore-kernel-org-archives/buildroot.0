From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 May 2010 14:55:08 +0200
Subject: [Buildroot] buildroot-2010.05-rc2, problem with binutils-2.20.1
In-Reply-To: <1274517204.15163.3.camel@bernd-desktop>
References: <1274422785.5719.8.camel@bernd-desktop>
	<20100521122542.5c4b0907@surf>
	<1274479497.25288.3.camel@bernd-desktop>
	<20100522003018.1ef13985@surf>
	<1274517204.15163.3.camel@bernd-desktop>
Message-ID: <20100522145508.10c885e7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 May 2010 10:33:24 +0200
Thomas <tokant@gmx.net> wrote:

> > -HOST_CFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib
> > +HOST_LDFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib
> 
> yes it works :-)

Ok, I will try to see if it still fixes the problem that the commit was
originally fixing.

Sincerely,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
