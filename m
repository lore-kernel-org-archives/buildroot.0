From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 15:08:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/iprutils: bump version to
 2.4.14.1
In-Reply-To: <20170605110620.25326-1-bernd.kuhls@t-online.de>
References: <20170605110620.25326-1-bernd.kuhls@t-online.de>
Message-ID: <20170605150822.10b58ebc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 13:06:20 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream:
> 
> 0001-iprutils-Don-t-use-gettext.patch
> https://sourceforge.net/p/iprdd/iprutils/ci/4512cfb915b492e9eed65f7b9f72fc1c1bd097c2/
> 
> 0002-configure.ac-use-pow-instead-of-matherr-for-libm-che.patch
> https://sourceforge.net/p/iprdd/iprutils/ci/d7cfe35b9706da357814d4bdd21563396733753c/
> 
> 0003-iprlib-fixes-for-compatibility-with-musl.patch
> https://sourceforge.net/p/iprdd/iprutils/ci/ed9da50d114ea5e97f3cf599fb7b305e0cec18d6/
> 
> Autoreconf is not needed anymore, added upstream hashes, switched _SITE
> to https.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../iprutils/0001-iprutils-Don-t-use-gettext.patch | 48 ----------------------
>  ...c-use-pow-instead-of-matherr-for-libm-che.patch | 36 ----------------
>  ...-iprlib-fixes-for-compatibility-with-musl.patch | 34 ---------------
>  package/iprutils/iprutils.hash                     |  5 ++-
>  package/iprutils/iprutils.mk                       |  6 +--
>  5 files changed, 6 insertions(+), 123 deletions(-)
>  delete mode 100644 package/iprutils/0001-iprutils-Don-t-use-gettext.patch
>  delete mode 100644 package/iprutils/0002-configure.ac-use-pow-instead-of-matherr-for-libm-che.patch
>  delete mode 100644 package/iprutils/0003-iprlib-fixes-for-compatibility-with-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
