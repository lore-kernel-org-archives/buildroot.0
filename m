From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 20:48:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/rapidxml: fix install path
In-Reply-To: <20190407194246.29625-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 7 Apr 2019 21:42:46 +0200")
References: <20190407194246.29625-1-bernd.kuhls@t-online.de>
Message-ID: <87zhofb5nu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > kodi-pvr-iptvsimple as of
 > https://github.com/kodi-pvr/pvr.iptvsimple/commit/d27b3ed1d379d2f865e95f08bdf2dbf086f8c0ad

 > depends on rapidxml but expects the headers in usr/include/rapidxml
 > instead of usr/include.

 > This changes the install path to be consistent with Debian and Gentoo:

 > https://packages.debian.org/stretch/all/librapidxml-dev/filelist
 > https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-libs/rapidxml/rapidxml-1.13-r1.ebuild#n22

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
