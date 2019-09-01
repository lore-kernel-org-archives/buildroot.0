From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 01 Sep 2019 11:56:14 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/libgdiplus: bump
 version to 6.0.2
References: <20190901082057.24706-1-bernd.kuhls@t-online.de>
Message-ID: <u6hs3gx121.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 01 Sep 2019 10:20:57 +0200 schrieb Bernd Kuhls:

> Removed patches applied upstream:
> https://github.com/mono/libgdiplus/commit/ad0fb6f0a5e3e11f7e474456d53cc660f7808aed
> https://github.com/mono/libgdiplus/commit/947e525d1025200623f686d8efe4c0094c5d2380
> 
> Added creation of directory m4/ to fix autoreconf.
> 
> Added patches to fix build of test programs without libjpeg/tiff.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Added patches to fix build of test programs without libjpeg/tiff.

Hi,

v1 and this patch did not show up on patchworks:
http://patchwork.ozlabs.org/project/buildroot/list/?series=&submitter=&state=*&q=gdiplus

Regards, Bernd
