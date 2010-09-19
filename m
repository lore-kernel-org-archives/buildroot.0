From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sun, 19 Sep 2010 12:22:57 +0200
Subject: [Buildroot] my todo list
Message-ID: <4C95E481.6020401@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi mailinglist,

Just to prevent redundant work, here is my planning list:

P1
- be ready for corrections on util-linux-NG and xfsprogs after your reviews
- be ready for corrections on transmission bittorrent client after your 
review

P2
- cups 1.3 installs in lib64 (which prevents correct work on the target) 
and is outdated, since I like to run my dockstar as a printserver I will 
take care of migrating to autotargets and make cups 1.4 to install 
correctly for 32bit targets

P3
- current python is rather outdated (version from 2006?) - it's in my 
field of view to upgrade to a recent 2.6 version
- webif is an old version (2006?) and is very router specific - luci 
seems to be good replacement, but there seems too much work to do...

Regards,
Marcus
