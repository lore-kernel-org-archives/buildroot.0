From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 04 Nov 2019 22:30:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/lxc: bump to version 3.2.1
References: <20191104131237.27902-1-patrick.havelange@essensium.com>
 <20191104220147.6b9ac9c2@windsurf.home>
Message-ID: <9th69gxcp2.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 04 Nov 2019 22:01:47 +0100 schrieb Thomas Petazzoni:

> Applied to master, thanks. Could you report the bug to the upstream
> uClibc-ng project that lxc can't be built/used anymore due to fexecve()
> being missing ?

Hi Thomas,

we already had http://patchwork.ozlabs.org/patch/1148360/ which also 
included the information that this bump fixed CVE-2019-5736.

Regards, Bernd
