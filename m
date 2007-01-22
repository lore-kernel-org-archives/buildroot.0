From: Sean M. Brennan <brennan@lanl.gov>
Date: Mon, 22 Jan 2007 08:42:17 -0700
Subject: [Buildroot] i386 soft float
Message-ID: <1169480537.4373.6.camel@smb1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been attempting to compile buildroot with soft float support for
i386. I've checked the list archives and even tried resurrecting quite
old uClibc patches for gcc 3.3.3, all to no avail.

My current impasse involves recent gcc versions balking at '-with-
float=soft' for the i386 target.

If anyone is at all familiar with this, I'd appreciate being pointed in
the right direction.

Thanks,

Sean
-- 
############################

Sean M. Brennan

Space Data Systems Group
International, Space and Response Division
Los Alamos National Laboratory
PO Box 1663, MS D440  Los Alamos, NM 87545

(505) 667-3319, fax: (505) 665-4197
brennan at lanl.gov

DSN-CC project: http://www.lanl.gov/dsn
