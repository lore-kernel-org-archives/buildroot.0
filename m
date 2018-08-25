From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Aug 2018 23:54:10 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/mariadb: bump version to
 10.3.9
References: <20180825204403.11324-1-bernd.kuhls@t-online.de>
 <20180825204403.11324-2-bernd.kuhls@t-online.de>
 <20180825230514.1f0264dd@windsurf>
 <o5u85fxpst.ln2@ID-313208.user.individual.net>
 <20180825233958.29369922@windsurf>
Message-ID: <2pv85fxpst.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 25 Aug 2018 23:39:58 +0200 schrieb Thomas Petazzoni:

> Indeed, atomic intrinsics are not always available, even when you link
> with -latomic: gcc versions before gcc 4.8 did not have libatomic. Build
> a SPARC gcc 4.7 toolchain, and try to build this package, you'll be
> surprised :-)

Hi Thomas,

ok, will also do that. Where can I get such a toolchain? Could you please 
point me to a defconfig?

Regards, Bernd
