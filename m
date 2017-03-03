From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 3 Mar 2017 04:00:29 +0100
Subject: [Buildroot] [PATCH 2/2] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <1488504021-598-2-git-send-email-ren_guo@c-sky.com>
References: <1488504021-598-1-git-send-email-ren_guo@c-sky.com>
 <1488504021-598-2-git-send-email-ren_guo@c-sky.com>
Message-ID: <20170303030029.GI14124@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guo,

Guo Ren wrote,

> gx6605s is a nice SOC for dvbs2 DVB product, and C-SKY inside.
 
I tried your patchset, the toolchain is not downloadable, empty
files in github.

WARNING: no hash file for
csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz
mkdir -p /home/wbx/buildroot/output/build/toolchain-external-custom
touch
/home/wbx/buildroot/output/build/toolchain-external-custom/.stamp_downloaded
>>> toolchain-external-custom  Extracting
>>> mkdir -p
>>> /home/wbx/buildroot/output/build/toolchain-external-custom
gzip -d -c
/home/wbx/buildroot/dl/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz
| tar --strip-components=1 -C
/home/wbx/buildroot/output/build/toolchain-external-custom
--exclude='usr/lib/locale/*'   -xf -

gzip:
/home/wbx/buildroot/dl/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz:
not in gzip format

Can the c-sky devboards be bought anywhere in Europe?

best regards
 Waldemar
