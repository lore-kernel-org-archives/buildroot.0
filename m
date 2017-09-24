From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Sep 2017 18:06:15 +0200
Subject: [Buildroot] [PATCH] libidn: fix build without makeinfo
References: <583676ae200bd379b846d5ccdcc5a2aafa4aad18.1506196074.git.baruch@tkos.co.il>
Message-ID: <no1l9ex29j.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 23 Sep 2017 22:47:54 +0300 schrieb Baruch Siach:

> Build fails when the makeinfo utility is not installed on the host.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[build-tested using http://autobuild.buildroot.net/
results/935/9353e6070dba5e01e8bcd2ecc4890e635be7e72d/]
