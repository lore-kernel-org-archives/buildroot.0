From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 11 Mar 2019 14:50:37 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-10
In-Reply-To: <20190311070050.A164586F58@hemlock.osuosl.org>
References: <20190311070050.A164586F58@hemlock.osuosl.org>
Message-ID: <20190311125037.GA20362@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Mon, Mar 11, 2019 at 07:00:44AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-03-10
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  23 |   1 |   0 |  24 |
>    2018.11.x |  26 |   1 |   0 |  27 |
>       master | 236 |  73 |   3 | 312 |
> 
> Results for branch '2018.02.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>        host-libunistring-0.9.7 | 1 
Regarding this, I found that the issue should be fixed in 0.9.10 version:

	https://www.mail-archive.com/bug-libunistring at gnu.org/msg00310.html

which is already latest in 2018.11.x and master branches, but not in 2018.02.x

> 
> 
> Detail of failures
> ------------------
> 
>  powerpc64le |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/1c6c0270dd6b11548d569045e000a322ed465727 |     
> 
> Results for branch '2018.11.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                runc-v1.0.0-rc6 | 1 
> 
> 
> Detail of failures
> ------------------
> 
>          arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/279638cda258eb4dbe3696b582569df9c051fe46 |     
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>           imagemagick-7.0.8-27 | 20
>             optee-client-3.4.0 | 10
>       host-uboot-tools-2019.01 | 8 
>                    netsurf-3.8 | 6 
>                 qt5base-5.12.1 | 5 
>            uboot-tools-2019.01 | 5 
>                    glm-0.9.8.4 | 4 
>                           opus | 3 
>                   brotli-1.0.7 | 2 
>                wireshark-2.6.7 | 2 
>           wpebackend-fdo-1.0.1 | 2 
>                    dvblast-3.4 | 1 
>                 gerbera-v1.3.0 | 1 
>                  libdrm-2.4.97 | 1 
>                   linuxptp-2.0 | 1 
>                  mesa3d-18.3.3 | 1 
>                    netsnmp-5.8 | 1 
>               python-pyqt5-5.7 | 1 
>               qt5enginio-1.6.3 | 1 
>                     stella-6.0 | 1 
> 
> 
> Detail of failures
> ------------------
> 
> microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/22d700d73982060baef2b667a6094f0f32610ccd |     
> microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/59db83040bd7186b80fac0fcd9a185dc8287b5d0 |     
>          arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/ce39455c2f0fa5a2fc68a6697b4dfceef6d07fc6 |     
>          arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/93b181bfb3eaa44a49b91d53a34e4cea78a9bdd8 |     
>       x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/1dc613ab39f081382709e88908f7edc77351f92d | ORPH
>       x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/adab17859782f312e6e32065808f41be3b878388 | ORPH
>       x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/ca04b07b58ed0bf35c9482564c422656858da0a4 | ORPH
>         i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/96cd54efa3062c4fc17f4672b6da1dfe25eb0838 | ORPH
>          arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2de85bad9a54da055ec9e941024c73e23faf4abb |     
>         m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1900541c85f59673f3aa6d3c0e96ba0ba6bdeb79 |     
>       mipsel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/fb5db093c98e55da2aca127530ab99a4ed64b891 |     
>         i686 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2cb5c2d91693b36b673c56ef58ee3bbe8ff30f8b |     
>         m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/48d9083d2cfd1f0ec802f352581ab4d70a029369 |     
>          arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5833089c3ae1a20bc6417607058256b9dbe925b9 |     
>       mipsel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2dc2bc75828564d57cef2ac86614a01a1a7cc675 |     
>  powerpc64le |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/38a2ddfe0799f3552979791b02ca4c736879ebc3 |     
>          arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/ced5f2cd2d94f72076d6dfaed6306c8902e8e420 | ORPH
>      powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/a4e29424278621ae38834e69e0ed666cb2902c87 | ORPH
>          arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/0bbfff7f0e6c54053ce3ce79d2fd095dba34d938 | ORPH
>         m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/3ba3e0d6ad6fff1d22ec200c7c4fb0d0fbc33a33 | ORPH
> microblazeel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/49db6f5572a061c7c1dd651454fbbd7effacd5c9 | ORPH
>         m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/9db040b5a131479c7330086fd684bc2284f401a8 | ORPH
>          arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/7fa8a60c2b6f3000ad303798c82003f8f3f481cd | ORPH
>         i686 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/4c2e3f233913f2045dda31ce86332e05a9638fdb | ORPH
>          arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/6ed69c7025d49cda2bc6f066e134aa1793c9803e | ORPH
>       xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/d005c4e4dd58142881e5cd6dc215e36173684d74 | ORPH
>         i686 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/be74c8693fb9fda00dabfaea4f0002fda83534a6 | ORPH
>          sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/1266eaea07f708ce371e2724fe3305142419717d | ORPH
>          arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/51991faee851e2ba18b6b39d88b13c930db182d1 | ORPH
>     mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/86843d9d853a2a6e6430e2d410653856a054de60 | ORPH
>       xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/b696772b67ac24d6bc48939c5342b64f611b51b2 | ORPH
>       xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/da39ee32d56e0cd8a1ddb7570f3f794362530a4f | ORPH
>       xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c4bf702170b10ea24681e2fef16ed3cc486109db | ORPH
>        sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/aa3a352f203e75b35fe4d9883bc704b1dc41247d | ORPH
>          arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/5068601d40bc3da323010bfdbd252eb433f87cd5 | ORPH
>       xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c4404b2c8b68a5a4aa5a627b8862edcaae184d9a | ORPH
>          arm |                  libdrm-2.4.97 | NOK | http://autobuild.buildroot.net/results/8d6194982c1080e173fcef8212fb06e6dc275d58 |     
>      aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/9effe4a9370e83824d6140bd9c20d1191c2113e1 |     
>          sh4 |                  mesa3d-18.3.3 | NOK | http://autobuild.buildroot.net/results/b1647d29135ab5019a972f153640a32e6494815b |     
>         m68k |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/0365a1a840b8125fff51b263348b49c926063a73 | ORPH
>         m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d80138d70e1b6694f61e943d3567c662affb0e4d |     
>          arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cb906d6025fb85d4a68d7b353e52371a60ff5fcf |     
>         m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c97288dde30fe70d9f83efa89a3847586773ea2e |     
>          arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c4444b281c5233b43411493ccbecea980bb84299 |     
>         m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d66ceba98f3b6cdfe2f595a9f169c47c084d2371 |     
>          arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5abcb2127c7e98397753e977ac6f3aac0f22f76c |     
>         or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e84671d915291161ce606950d77a57e543ed9375 |     
>          arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/80ee2a0f31f2174c8259886ef2b09dc995cfc506 |     
> microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4e22dade6449f1520f9acc0c8d7d2fe499bd8593 |     
>          arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/d3c4bf370299b7b3b922b00e352ed208e9ca271e |     
> microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/d6acf846034e702831674c08fdcc1a4458223e6f |     
> microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/a678e5a23fc295d2a4453085c93e23f311b4ed91 |     
>          arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e1fd8f55cab4322499ce05e504e7f5297d9a0305 |     
>         or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/98bdb4e4f1a047ff7dbb1917ea4c4b889dd2a664 |     
> microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/9c3d541dc451526f61c1787802ada1abe61ac54e |     
>          arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4f0cfc2aa5a095a95edc886de7c6d63d7da2ba2b |     
> microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/a77ffa0bb6f299aa9421ba03b27b0214e91dd489 |     
> microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/0e7ae985e58a4d90742e253b94f74379b77f71dc |     
> microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/1e4d786751bc7c3dcd5c51999a970a80f642ab19 |     
>      aarch64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/a22ce84003177c59e0833758fd7840e5e938c9ba |     
>   aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/47a377f7f675a846aaef0b47c1a4091dee835d8f |     
>       x86_64 |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/9149543f6ad9b02ec5ca489f9d54e925c2681733 |     
>   aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/10e3388f1f85ab16098bed1c9b4fa6de94fded88 |     
>   aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/5d11fa4c60bfa441cf063fb1a2491918be2507c4 |     
>       x86_64 |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/e7a4e9b1733e4f0388de79bb56bbe39853d880c5 |     
>          arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/110cfb9fe66936199f1e5bb806a94dc388782292 |     
>          arm |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/b55d323a1298a7929cb4e15a529e1f6c8e23385b |     
>          arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3f7925762c620636a1b0926ea86dd403796ce7d2 |     
>          arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c6ab9a679d693c81330af36aa68936d7c736cd22 |     
>          arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/eb54ca925196414d4c68c916f7551e9a93562650 |     
>          arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/71ed96b626ed78b920dd2e2d96529702cd40eb9f |     
>      powerpc |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3b02f70c81ac106c3f4360300a3caa70ad069471 |     
>      sparc64 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/8262e9a3a8b36d97a243f31fa5bdb5ef15d62b54 | ORPH
>         i586 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/37d3a3df2c4293218a8c7ea60103bf092a6a1b67 | ORPH
>      aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/ef355e7fad0409c989455fb23624e4b38fc2e8a4 |     
>      aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/c4b89bb7ef9c77ee4c1dab39006cb41b4e3af0e6 |     
> 
> 
> -- 
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Vadim Kochan
