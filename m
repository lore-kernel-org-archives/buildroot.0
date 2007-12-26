From: Candy Man <candyman80211@gmail.com>
Date: Tue, 25 Dec 2007 19:47:15 -0500
Subject: [Buildroot] Build Error: Unable to download fakeroot source
Message-ID: <3ca501d60712251647i19b8bb46i5fbe7281cafa0993@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just downloaded the latest version of buildroot via subversion, but
when trying to run 'make source' I get the following error:

wget --passive-ftp  -P /home/will/box/v0.0.2/buildroot/buildroot/dl
http://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.8.2.tar.gz
--19:41:44--  http://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.8.2.tar.gz
           => `/home/will/box/v0.0.2/buildroot/buildroot/dl/fakeroot_1.8.2.tar.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
19:41:44 ERROR 404: Not Found.

make: *** [/home/will/box/v0.0.2/buildroot/buildroot/dl/fakeroot_1.8.2.tar.gz]
Error 1
