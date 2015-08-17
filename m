From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 22:54:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/cifs-utils: add upstream patch
 to fix musl build
In-Reply-To: <1439654841-18845-1-git-send-email-joerg.krause@embedded.rocks>
References: <1439654841-18845-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150817225454.4452a50d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 15 Aug 2015 18:07:21 +0200, J?rg Krause wrote:
> Fixes build error with the musl C library:
> 
> ```
> error: '_PATH_MOUNTED' undeclared (first use in this function)
> ```
> 
> Fixes:
> http://autobuild.buildroot.net/results/44e/44e800d9933160c48b9c2447d63eeb37a0065d03/
> http://autobuild.buildroot.net/results/b9f/b9f918bba4952566e3818fb99f45a7e425acf727/
> http://autobuild.buildroot.net/results/8de/8dec8c46ad1959066101efe7cc1781f3d4732028/
> http://autobuild.buildroot.net/results/cc3/cc38e7581b4bba362a9be388099b0ea237f4e580/
> 
> and many more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/cifs-utils/0001-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
