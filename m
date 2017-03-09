From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 00:10:52 +0100
Subject: [Buildroot] Buildroot 2016.11.3 released
Message-ID: <87zigu9hc3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2016.11.3 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.11.3.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.11.3.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Buildroot 2016.11.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2016.11.2 release.

- Fixes for static compilation issue in stunnel.

- Security fixes for gnutls, lcms2, libcurl, ntfs-3g, ntp, openssl,
  php, quagga, redis, squid, tcpdump, vim, wavpack, wireshark and
  xlib_libXpm.

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2016.11.2..
     9  Peter Korsgaard
     7  Gustavo Zacarias
     5  Vicente Olivert Riera
     3  Baruch Siach
     2  J?rg Krause
     1  Adam Duskett
     1  Bernd Kuhls

Notice that this is the final 2016.11.x release. Users are urged to
migrate to the 2017.02.x series, which will be supported until February
2018.

-- 
Bye, Peter Korsgaard
