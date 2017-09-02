From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 20:12:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/fontconfig: bump version to
 2.12.4
In-Reply-To: <20170902173109.22816-1-bernd.kuhls@t-online.de>
References: <20170902173109.22816-1-bernd.kuhls@t-online.de>
Message-ID: <20170902201248.106b7688@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Sep 2017 19:31:09 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream:
> https://cgit.freedesktop.org/fontconfig/commit/?id=1ab5258f7c2abfafcd63a760ca08bf93591912da
> 
> We need to keep the host-gperf dependency even when upstream ships the
> generated file fcobjshash.gperf in its release tarball because in the
> next release this file is removed:
> https://cgit.freedesktop.org/fontconfig/commit/?id=651f1227646174b5be0186b4b6cdff3a7134d869
> and is always generated during build:
> https://bugs.freedesktop.org/show_bug.cgi?id=101280
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ts-with-integer-width-macros-from-TS-1866.patch | 50 ----------------------
>  package/fontconfig/fontconfig.hash                 |  4 +-
>  package/fontconfig/fontconfig.mk                   |  6 +--
>  3 files changed, 3 insertions(+), 57 deletions(-)
>  delete mode 100644 package/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
