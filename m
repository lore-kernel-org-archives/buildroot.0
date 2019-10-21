From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 21 Oct 2019 09:41:39 -0300
Subject: [Buildroot] [PATCH] package/qemu: move patch 3 to the 3.1.1.1 subdir
Message-ID: <20191021124139.28615-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Required since the bump from 3.1.1.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Do we really need the subdir? I know that qemu keeps four releases but
as far as I know Buildroot always included only one. Are there plans to
add a configuration to choose the qemu version?
---
 ...0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/qemu/{3.1.1 => 3.1.1.1}/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch (100%)

diff --git a/package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/package/qemu/3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
similarity index 100%
rename from package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
rename to package/qemu/3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
-- 
2.18.1
