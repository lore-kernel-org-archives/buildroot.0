From: Chris Bare <chris@bareflix.com>
Date: Thu, 30 Apr 2009 17:05:01 -0400 (EDT)
Subject: [Buildroot] libidn problem
Message-ID: <20090430210659.EC0001C4523@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

is anyone else using curl and running into a problem with libidn.so?

My link line ends up with this: /usr/lib/libidn.so
instead of the proper path under buildroot. I am not linking to this directly,
but it appears to be a libcurl dependency.

libcurl's config.log indicates that it could not find libidn:

/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld:
cannot find -lidn
collect2: ld returned 1 exit status

I'm not sure where it comes from but I do have libidn.* in /usr/lib under
binaries etc for my target.

Any pointers would be appreciated.
-- 
Chris Bare
chris at bareflix.com
