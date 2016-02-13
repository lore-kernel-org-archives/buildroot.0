From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Feb 2016 16:33:26 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/numactl: Fix uClibc compile
 breakage after musl compile fix
References: <1455304949-16808-1-git-send-email-bernd.kuhls@t-online.de>
 <20160212224934.32cd9661@free-electrons.com>
Message-ID: <6vu3pcxqnk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 12 Feb 2016 22:49:34 +0100 schrieb Thomas Petazzoni:

> Did you verify this solution with a build against a musl toolchain ?

Hi Thomas,

yes, I did a sucessful build with the same musl defconfig which triggered 
the build error first: https://git.busybox.net/buildroot/commit/package/
numactl?id=21ed7a92fe5a771911ef06f97522e504d0eebbc2

Upstream committed the patch in the meantime: https://github.com/numactl/
numactl/commit/3770bdc4fa7b9059db5cd2aa8bb09b50fa15e456

Regards, Bernd
