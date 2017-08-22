From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 22 Aug 2017 20:37:29 +0200
Subject: [Buildroot] [PATCH] dbus-cpp: fix build with gcc 7.x
References: <20170821220442.12240-1-thomas.petazzoni@free-electrons.com>
Message-ID: <98au6ex5ie.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 22 Aug 2017 00:04:42 +0200 schrieb Thomas Petazzoni:

> This commit adds a patch to dbus-cpp to make it build with gcc 7.x.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/
results/07a7559c0efeeda16c239e0fa06259d4cd48c71b/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[ build-tested using http://autobuild.buildroot.net/
results/07a/07a7559c0efeeda16c239e0fa06259d4cd48c71b/defconfig ]
