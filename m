From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Thu, 30 Sep 2010 20:38:31 +0200
Subject: [Buildroot] patch for cups which had some build bugs in former
	version and update to autotargets
Message-ID: <1285871912-11737-1-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglist,

the former version of cups in br installed its libraries under usr/lib64
(at least if building on 64bit host)
which made cups not work by plain run through

this patch coverts cups to autotargets and updates to new version 1.4.4

furthermore the init.d skript was named cups - inittab launches a skript
which starts all S* skripts in init.d, so cups need to be prefixed with S?? too


Regards,
Ossy
