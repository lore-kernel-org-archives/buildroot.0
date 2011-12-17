From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Dec 2011 21:47:37 +0000 (UTC)
Subject: [Buildroot] [Bug 4622] Unable to download properly file
	fakeroot_1.9.5.tar.gz
In-Reply-To: <bug-4622-163@https.bugs.busybox.net/>
References: <bug-4622-163@https.bugs.busybox.net/>
Message-ID: <20111217214737.D237B8FA84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4622

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2011-12-17 21:47:37 UTC ---
It seems to work here. What does your HTML file contain exactly?

make fakeroot-source
>>> fakeroot 1.9.5 Downloading
--2011-12-17 22:35:48-- 
http://snapshot.debian.org/archive/debian/20080427T000000Z/pool/main/f/fakeroot//fakeroot_1.9.5.tar.gz
Resolving snapshot.debian.org (snapshot.debian.org)...
2001:630:206:4000:1a1a:0:c13e:ca1e, 193.62.202.30
Connecting to snapshot.debian.org
(snapshot.debian.org)|2001:630:206:4000:1a1a:0:c13e:ca1e|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 395829 (387K) [application/x-tar]
Saving to: `/home/peko/source/buildroot/dl/fakeroot_1.9.5.tar.gz'

100%[======================================>] 395,829      840K/s   in 0.5s    

2011-12-17 22:35:54 (840 KB/s) -
`/home/peko/source/buildroot/dl/fakeroot_1.9.5.tar.gz' saved [395829/395829]

tar zxvf dl/fakeroot_1.9.5.tar.gz
fakeroot-1.9.5/
fakeroot-1.9.5/AUTHORS
fakeroot-1.9.5/message.h
fakeroot-1.9.5/NEWS
fakeroot-1.9.5/contrib/
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/MANIFEST
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/META.yml
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/README
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/Makefile.PL
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/lib/
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/lib/Fakeroot/
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/lib/Fakeroot/Stat.pm
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/t/
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/t/Fakeroot-Stat.t
fakeroot-1.9.5/contrib/Fakeroot-Stat-1.8.8/Stat.xs
fakeroot-1.9.5/configure
fakeroot-1.9.5/README
fakeroot-1.9.5/test/
fakeroot-1.9.5/test/t.touchinstall
fakeroot-1.9.5/test/t.option
fakeroot-1.9.5/test/compare-tar
fakeroot-1.9.5/test/t.tar
fakeroot-1.9.5/test/tartest.tar.gz.uue
fakeroot-1.9.5/test/t.mknod
fakeroot-1.9.5/test/tartest
fakeroot-1.9.5/test/t.falsereturn
fakeroot-1.9.5/test/t.truereturn
fakeroot-1.9.5/test/t.echoarg
fakeroot-1.9.5/test/Makefile.in
fakeroot-1.9.5/test/echo_arg
fakeroot-1.9.5/test/Makefile.am
fakeroot-1.9.5/simple.c
fakeroot-1.9.5/communicate.c
fakeroot-1.9.5/BUGS
fakeroot-1.9.5/config.sub
fakeroot-1.9.5/acinclude.m4
fakeroot-1.9.5/DEBUG
fakeroot-1.9.5/configure.ac
fakeroot-1.9.5/config.h.in
fakeroot-1.9.5/scripts/
fakeroot-1.9.5/scripts/fakeroot.in
fakeroot-1.9.5/scripts/instdebug
fakeroot-1.9.5/scripts/Makefile.in
fakeroot-1.9.5/scripts/Makefile.am
fakeroot-1.9.5/libfakeroot.c
fakeroot-1.9.5/aclocal.m4
fakeroot-1.9.5/communicate.h
fakeroot-1.9.5/ChangeLog
fakeroot-1.9.5/ltmain.sh
fakeroot-1.9.5/COPYING
fakeroot-1.9.5/wrapfunc.inp
fakeroot-1.9.5/statconv/
fakeroot-1.9.5/statconv/glibc/
fakeroot-1.9.5/statconv/glibc/linux/
fakeroot-1.9.5/statconv/glibc/linux/alpha/
fakeroot-1.9.5/statconv/glibc/linux/alpha/stats.h
fakeroot-1.9.5/config.guess
fakeroot-1.9.5/debian/
fakeroot-1.9.5/debian/fakeroot.prerm
fakeroot-1.9.5/debian/rules
fakeroot-1.9.5/debian/control
fakeroot-1.9.5/debian/copyright
fakeroot-1.9.5/debian/changelog
fakeroot-1.9.5/debian/fakeroot.postinst.in
fakeroot-1.9.5/debian/fakeroot.postrm
fakeroot-1.9.5/Makefile.in
fakeroot-1.9.5/depcomp
fakeroot-1.9.5/wrapawk
fakeroot-1.9.5/INSTALL
fakeroot-1.9.5/missing
fakeroot-1.9.5/doc/
fakeroot-1.9.5/doc/sv/
fakeroot-1.9.5/doc/sv/faked.1
fakeroot-1.9.5/doc/sv/fakeroot.1
fakeroot-1.9.5/doc/sv/Makefile.in
fakeroot-1.9.5/doc/sv/Makefile.am
fakeroot-1.9.5/doc/faked.1
fakeroot-1.9.5/doc/README.saving
fakeroot-1.9.5/doc/po4a/
fakeroot-1.9.5/doc/po4a/po4a.cfg
fakeroot-1.9.5/doc/po4a/addendum.1.nl
fakeroot-1.9.5/doc/po4a/addendum.1.es
fakeroot-1.9.5/doc/po4a/addendum.1.fr
fakeroot-1.9.5/doc/po4a/addendum.1.sv
fakeroot-1.9.5/doc/po4a/po/
fakeroot-1.9.5/doc/po4a/po/fakeroot.pot
fakeroot-1.9.5/doc/po4a/po/es.po
fakeroot-1.9.5/doc/po4a/po/nl.po
fakeroot-1.9.5/doc/po4a/po/fr.po
fakeroot-1.9.5/doc/po4a/po/sv.po
fakeroot-1.9.5/doc/fr/
fakeroot-1.9.5/doc/fr/faked.1
fakeroot-1.9.5/doc/fr/fakeroot.1
fakeroot-1.9.5/doc/fr/Makefile.in
fakeroot-1.9.5/doc/fr/Makefile.am
fakeroot-1.9.5/doc/fakeroot.1
fakeroot-1.9.5/doc/es/
fakeroot-1.9.5/doc/es/faked.1
fakeroot-1.9.5/doc/es/fakeroot.1
fakeroot-1.9.5/doc/es/Makefile.in
fakeroot-1.9.5/doc/es/Makefile.am
fakeroot-1.9.5/doc/nl/
fakeroot-1.9.5/doc/nl/faked.1
fakeroot-1.9.5/doc/nl/fakeroot.1
fakeroot-1.9.5/doc/nl/Makefile.in
fakeroot-1.9.5/doc/nl/Makefile.am
fakeroot-1.9.5/doc/Makefile.in
fakeroot-1.9.5/doc/Makefile.am
fakeroot-1.9.5/setenv.c
fakeroot-1.9.5/faked.c
fakeroot-1.9.5/Makefile.am
fakeroot-1.9.5/install-sh

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
