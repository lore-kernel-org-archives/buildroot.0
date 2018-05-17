From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Thu, 17 May 2018 08:51:57 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-16
In-Reply-To: <20180517060016.CB1F92071F@mail.bootlin.com>
References: <20180517060016.CB1F92071F@mail.bootlin.com>
Message-ID: <CAPP7BN2g6Wr6NE9C0ALM9YHf1RcwzFTQ=tyhnpJwR=4rBMxHrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

2018-05-17 8:00 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> Build statistics for 2018-05-16
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  32 |   4 |   0 |  36 |
>       master | 309 |  47 |   2 | 358 |
>
> Results for branch '2018.02.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                    libnss-3.33 | 2
>                      php-7.2.5 | 1
>                qt5webkit-5.9.1 | 1
>
>
> Detail of failures
> ------------------
>
>     mips64el |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/9d52e64652c65abbc1468ee450ce24c6f103104f | ORPH
>          arm |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/7eba12a46ac56c735fd8440a444a69adb7c829c3 | ORPH
>          arm |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/e66fe1524147aea02f6a5a55b09714f8599a6968 | ORPH
>      aarch64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/f41f3213de287b2afbdc0182fe40e80a71205a6a |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                    libnss-3.35 | 10
>                   autofs-5.1.4 | 9
>           host-faketime-v0.9.6 | 7
>                     quota-4.01 | 5
>                host-llvm-5.0.1 | 4
>                    exim-4.89.1 | 2
>                log4cplus-2.0.0 | 2
>                   samba4-4.8.1 | 2
>                          boost | 1
> host-imx-mkimage-rel_imx_4.... | 1
>                         libnss | 1
>                       qt-4.8.7 | 1
>                  qt5base-5.6.3 | 1
>              qt5location-5.6.3 | 1
>                     sdl-1.2.15 | 1
>            uboot-tools-2018.03 | 1
>
>
> Detail of failures
> ------------------
>
>       mipsel |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/3c3f850572406352cf9334610e8a61c9b8f4d03a |
>        nios2 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/2dd77567a4a7ab042d19c1c220e5215385b36d7d |
>      sparc64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/bce23d7fc6619d9d1c6bdbb6a85069390e57b820 |
>        nios2 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/7a4140bae12dd0e6f73aae1c09ccde5629e9b9f4 |
>       mipsel |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/e7022e9e3ab284fe800ebe2b347641fa5e11518b |
>     mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/1656bfcda9c41d35949e1a6972f8f869c63839f9 |
>         mips |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/fd1b9d18f927b6400b46c78d8553c7ec8fca2c07 |
>         mips |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/e0fc26181a694fc30b46de5949bcbe9858d7031c |
>          arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/7ace3a6a7b48a5ede72f02d17f631653db8fbf4f |
> microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/01010c9cbc91ef2b788ec6d5445250620a89ad7e |
>          arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/6c588279c7b4c850d1aed3bac478bf45192dcbd9 |
>          arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/3360e68b7a6050af7123c506b30908d4cfdc3ab2 |
>          arc |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/ed9066b0bc01d8bfc9a38b5462c2fd1a44cc5e15 | ORPH
>          arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/4e1d92bdc7ab65ae1a511e76f55beb9c9b0a59a3 | ORPH
>  powerpc64le |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/dd2a27c938a610da7833a4be3695178fddbbc1b4 | ORPH
>         or1k |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/57209cde2f9bed66f50e87c0b797df76ca0957bf | ORPH
>         mips |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/f411f36c65130f62ed1959a8dfa836e431e1bf63 | ORPH
>          sh4 |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/b67e7aa122376cca3e3aecf80889e845639816d8 | ORPH
>       mipsel |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/e3f59430026c206225cae0e2809e05f98137e8b1 | ORPH
>          arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/7c63ab1188a45d4684e159456f561a4e7c39e612 |

This error is because the hash is incorrect. But I don't really
understand why. I've downloaded the new source and compared it with
the old source that I had in my dl folder and it's the same. There are
no changes in the git-repo but when I compare the tar.gz file in the
dl folder they differs, just as the test notice. So the simple
solution would be to update the hash value and commit it. But I don't
really like not understanding why this error happens at the first
place.

>
>      aarch64 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/ad8056cc8e25a7867725f57bcba8c59324f99377 |
>      aarch64 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/018116b394de4e5afcb3c198d16fd964b838d7a9 |
>      aarch64 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/5a21f76e0d801989cd74cefdb31e21b0a5251c3e |
>          arm |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/136f1c1d27fad5892754d27b7af544edcbc852f9 |
> microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/9c91341571449b9e9345252c9a8db16c8d8138ad |
>      sparc64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/0f775e057dca81ab60764540aa428e2e0798544d | ORPH
>          arm |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/4c44b5c2a26370633a302f10e7f369da0b208079 | ORPH
>       x86_64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/a5580a83ef511c6ecc17cebee87fa4687dc37b1f | ORPH
>         or1k |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/4d6881cb12be8ab753c5d28a9f9d7126da9709cb | ORPH
>         i586 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/23f7336ece2eaac4f83e2defcfa4dda0fdb993d6 | ORPH
>     mips64el |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/23416f6f7b4a4866935cd6b4377cbe2c2dad9f96 | ORPH
>      aarch64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/451acdca2426740e1428507f3249beb714d21fdf | ORPH
>  powerpc64le |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/e99ab4d8f7170813949233c37d2facd3b6822d1a | ORPH
>    powerpc64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/f0c10e3bdf78f8ced574bb1722bb84b3a0b8c2d1 | ORPH
>     mips64el |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/892ed881c1ce62102aedac0c4f9337c4588890e4 | ORPH
>      powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/b295819e69a10e97999d248b9003073670e4689b |
>      powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/6a5c85e15ca4dceeac176990d53451a1733e16eb |
>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3d8f0478c6ddd51c0454d4b8aecc0623b5248c7f | ORPH
>          arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/2bc6f303229ee767ce58f47059de79471e0bf25a |
>      powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/67a57bd64bc67273413b5e5ce7bfc3243ce72d26 |
>     mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/eed9dbec5f2b9d2771922706e625f4ea80c6f5da |
>         m68k |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/eeec06779dbd290e6b5831d0a423abf8db19ccbf |
>          arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/09f0b5994e91807a16c0ca4e8ca37474e61cbcea |
>         or1k |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/6b43c96ebc72886125d6f8897b48208033451db5 |
>      sparc64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/828326637258b2f31a40292dfc966c7ca5ce20d9 |
>    powerpc64 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/a4db07cefdd1fcfecd04eea2000793fd5828808e |
>          arm |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/ae16a8fcb16e24931c2b5d05243d04a3983a33ae |
>          arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/ca4a33299fb8f06d00b7aee050081a694ee0766e | ORPH
>          arm |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/ea7431ec29ae307f1dead5134d2325b1a6f01d15 |
>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Best regards,
Erik
