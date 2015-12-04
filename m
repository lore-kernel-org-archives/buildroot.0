From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 4 Dec 2015 08:42:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-12-03
In-Reply-To: <20151204073021.1945A102F25@stock.ovh.net>
References: <20151204073021.1945A102F25@stock.ovh.net>
Message-ID: <CAGm1_kvzDq-NkkRdmSp_4RvQSnjvyO-tPEOtWxFbv8DrnEK=+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 4, 2015 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2015-12-03
> ===============================
>
>         success : 209
>        failures : 251
>        timeouts : 0
>           TOTAL : 460
>
> Classification of failures by reason
> ====================================
>
>                      crda-3.18 | 52
>                  pixman-0.33.4 | 26
>                      flite-1.4 | 21
>                 xfsprogs-4.3.0 | 16
>                     gcr-3.18.0 | 14
>                  libass-0.13.0 | 13
>                  libeet-1.7.10 | 11
>                   gnutls-3.4.7 | 9
>               host-cmake-3.4.1 | 9
>              lttng-tools-2.7.0 | 9
>                libcap-ng-0.7.4 | 5
>                arptables-0.0.4 | 4
>               alsa-utils-1.1.0 | 3
> canfestival-7740ac6fdedc23e... | 3
>                   ffmpeg-2.8.3 | 3
>                    mplayer-1.2 | 3
>                  liburcu-0.8.7 | 3
>                    bdwgc-7.4.2 | 2
>                 pinentry-0.9.4 | 2
>                  setools-3.3.8 | 2
>              host-nodejs-4.1.2 | 2
>                   libnspr-4.11 | 2
>               xmlstarlet-1.5.0 | 2
>                   trinity-v1.6 | 2
> freerdp-17834af7bb378f85a3b... | 2
> flann-04b4a56533faf8c8228d0... | 1
>                      fastd-v17 | 1
>          network-manager-1.0.6 | 1
>                libbluray-0.8.1 | 1
>                    cmake-3.4.0 | 1
>        openpgm-release-5-2-122 | 1
>                 iprutils-2.4.5 | 1
>                   nodejs-4.1.2 | 1
>                 grantlee-0.5.1 | 1
> tstools-08f6be304040e7b8476... | 1
>             netsniff-ng-v0.5.9 | 1
>                       qt-4.8.7 | 1
>               dropbear-2015.71 | 1
>                  dropwatch-1.4 | 1
>                  mesa3d-11.0.6 | 1
>             kodi-15.2-Isengard | 1
>                 directfb-1.7.7 | 1
>                 libmbim-1.12.2 | 1
>             libsemanage-2.1.10 | 1
>              ipsec-tools-0.8.2 | 1
> ltrace-c22d359433b333937ee3... | 1
>                   connman-1.30 | 1
> pifmrds-0bf57f9ce0d954365a3... | 1
> sconeserver-3b886c3dda6eda3... | 1
>                  opencv-2.4.10 | 1
>                     neard-0.14 | 1
>               squeezelite-v1.8 | 1
>             shairport-sync-2.6 | 1
>             libopenh264-v1.4.0 | 1
>                    lite-0.8.10 | 1
>                     php-5.6.16 | 1
>
> Detail of failures
> ===================
>
>          arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/c770760c6299e41c1ff6a1a53fa9f08979b5aee9/
>          arc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/53eab47af6db2df176cd17bcad3115d302f7c826/
>          arc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/e4eb164433649e123d7e0814b8efa5c266cf87aa/
>       x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/e37dc745adcf5f46e0e7de8591728cf2f657be9e/
>          arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/fb5489b3ab10e99ffe3e510969624a6ea86dec2e/
>       x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/f9e71c336732f53370ee7282fb7ad12e7e9ebd8a/
>          arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/eade082272abdf1df6e6084ba5aeff311a41ad01/
>        sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/7dc26a5ef6e0e6cc6980386c2cdb38f859903e8a/
>        sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/5a7f1e7a72f2fbfb0898d993e92b9f416bc5b8e5/
>       x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2f00869e156d1de9a3903977a5139595287cda23/
>       x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/f651fcf75dd01f090776c029f90caf685cae85b5/
>          arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2707211ef04221c8a7e67b87bc4856477e98d6a3/
>          arm |                    cmake-3.4.0 | NOK | http://autobuild.buildroot.net/results/0ff17a0e6115c024a662851e8b0b58385e8e069d/
>       x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/ab5ef5fb3e6fda38e0567a532ed6f934f3f7e0f6/
>         i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a6e97517d4e77808ee2ed2716d56d434cde13c2f/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e341a3d411359dca745cfe42e7a0dd36c521b553/
>       x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/578e3e17777e1c6633dce54179a815fc2c0a183a/
>      sparc64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/64e9e711ec6141268f934eaa29912d2419468a6c/
> microblazeel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f306486174449496066328fcdc01289075e37bd9/
>          arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/fe08a3443ce7750fe71ccdab3988ffbf80b4e6ae/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/77bb3c579c5d9c9c181e090e2f5525dc8457fd9b/
>         bfin |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/1e64d259bf72923260fe1bbd813fc62c98064ca7/
>      powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/8ea96ce62506e44521d55717b769cdadf62855b1/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6ce081cda721385344ee12410ead3393e456ae1a/
>         i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/79e221a854078e34f506461f1d7b2ef27bb73f9a/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/193158e5eb334d05958465683535158650dec3fc/
>       x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/5a9f95d1ffd8db586a6bb8887d8acec4ba4ecc04/
>      powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/bd0d032c838bb1c2a2395bcb07b30a16f6c8d846/
>       mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/1ff4867214c4e913ef713faa5ca31dde22f6142a/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/c146b299c3bdc4063acb302fc47a769870d25eeb/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/141602ff37aa65c3f66e9c1d6e9b82daffe866a6/
>         sh4a |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/59fdf6ba191b99547e444446421858e5bd0687ec/
>         mips |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/486ad3d5b3eed4d79e8478644f7bd26d2bc15c11/
>       xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/2c7c64bf9bc8dd6e3e275aeef6ad58588772ff86/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/43946329cad75b2938b4156dc7f06569158c4ca7/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a2ebfa1bdd4bf89c64b05072d9476523a52c7471/
>       x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/cd0f8f2c97b08751eb3d58c885078e036e9b3fb2/
>      powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/02c33554d6d95d5b06899a5e61bccadc67bab468/
>       x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6c89a6ca4d6c72e22937e754a0a0e5c94c20bb0e/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/4aab1b2b91bb84f8112126ba291e4534ed194dc7/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/cca202d39e958df4f374566cf006f4eafcc15129/
>         i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f80aad6ae522e16e860b3d63221719ff230fedb8/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6d09d404b85741af4931278e8b532c4f289da91d/
>      powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/b00ad23f343ae90fcd5cff6bcc03645237733319/
>      sparc64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6f495f4a5708176b995929a3e7c36082ff95e588/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/5c6691358e471af9940ab60512e89f8c3dcafa93/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f7afffb65b2ab55824dd2874eacd458bf7d30fd5/
>          arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a7e54e3a3e7660ee750b40e6cd81e84847b02a96/
>       mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/33df5de6013007e36860a98bc36f4ad8911aa23e/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/bb0458b3c737c1693d699a7ec3e479bf66f6da33/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/9378b2d6948ae6a809fb76a900ced86a9abc3cfc/
>      aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/89a75e59e228d9edfd3e3fa69c5df594a3626e10/
>      powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/12bc49414d1465288a958278a7852477388cf34e/
>       mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7ab34c57e1e2993aded3d413fca39cffc86fd920/
>          sh4 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6c5cfc6ee09ae540b279a17ed0808a5c7ad030de/
>       mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/fd0956380c643e56f9dbdc0e7cd9127742cd7874/
>       xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ee7025a81c5afd324de887b67be814c5940f89c6/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/b6a75f3d6748a0e5ac83461fe32d1900fb1d83cf/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6f84c632acc5ff230bdbab6add38b6a33b6c9b9f/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/c23c564bf305cc12fbffb6c2ea4e146d74f067db/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7920b7b8b2f265c7b99ce6d62dab580dbd321db6/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/b2fd467a4631b36755896e332ae2880e23b798ee/
>          arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6ff80c17ef05317857461cede75534002c7dcb63/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/4fb625312b6fa9a12b5ab9e8657654c30af86655/
>         mips |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6ac8c3725e3b229804d29954253c8b65c18485d9/
>     mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f5efd089ab982810c5026933cd0289ce5e8187b9/
>        sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/8205100c166659c47daff66b1e63edc82eeb7930/
>     mips64el |               dropbear-2015.71 | NOK | http://autobuild.buildroot.net/results/589b315ba5b12b8638f27fe3adc81b0681a9b531/
>          arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/cb94a009bd2eb4c20ab64975f4f557b0f38541dc/
>        sparc |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/4d0d9ed02831ee38ae8ae3689db46d6cf517a3ca/
>     mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/e86bdd2fb98dd0fb00a9f920d7e210303dbb4eb0/
>     mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/1798221e85dc484b13d4cbdd05a0ce7644cade36/
>         mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/c6cc2380953aa856ae88de94ad89032fc72e68a3/
> microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/fdf5c5a38ac88621c49c647c92e9cf541e6038b1/
>          arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/0b0e61324a005992e10a4aac63f45db2cee87fbc/
>         sh4a |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/37505fc912cfd60e895e1acfc1df568fef222792/
>       x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/1f61e7770fa5afbe7fddfd86b188bd749435b548/
>       mipsel |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/e424cb4ced795e351b620d0bc6482391a34040ac/
>      aarch64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/1f6ffa59d171cffbed06be726c8dc8ff52533c0f/
>      aarch64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/7f485f3d60165c75221edc90b1055082cd3b1f37/
>          arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/4efd839afb8536bdf3489ab523a293f513e9bb84/
>         sh4a |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/cadf779987f683b61cf65298be3f719bdd51024a/
>       x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/b1cdd2c60fcc75f41cfc1e930356bb506e15b668/
>          arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/5d2c17d725e5d3f847ad1594e74b3a4d33dfc17a/
>       x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/cf8fd8fa1863ef8ef598514d70c136f5094ef048/
>          arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/407091c1f0cd94a22e75ccf29854b97a831b0540/
>          arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/87f6406aaf6d6709dace35fd55f397870e570c6d/
>         i686 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/de20ae43c58ea4204f94df7c6246454b05eb931b/
>     mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/4ec7f6eac514ad188f405ed114fd40d6555e981c/
>          arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/a2b3c8a72c740263099dc2754582c57fd1206da2/
>         sh4a |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/f7ffee4782a5c79849be18739fbd875697632afc/
>       mipsel |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/f7cd476ee18ea9506a8b22588fd8fbe1ddf432f9/
>         i686 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/b3707f64ecfae4838516b045bd5ad10e03e142da/
>       mipsel |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/12dc530897d3d53372e0abd36989543b51f411af/
>      powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/da8f356651b6855ed6486ff167e48887e1986bde/
>       x86_64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/5cc9bb3c9832c6ceac3f7c0d9d0f9078cedf8273/
>       x86_64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/8aa339777493bb07d9d98d6df4e8f26f0a8e27a3/
>         i686 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/fdd0aeabd0ba9559a653540215501f758d39a2cd/
>      powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/289e52ba071231f14b6e21a011e19d3f41821037/
>          arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/88fdc1761dcefde74d5c33ab6e9d9b673829cd60/
>     mips64el |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/31603af4e8809b9d573be25d3a53c4e18b34768a/
>          arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/0d805af9dc7f512270f0d775ecdb4ef1143d8395/
>          sh4 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/5d0a29ce91788298b69f2295c0f5a7aefd281a39/
>     mips64el |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/6a786d39ce8cb32743c3cc3666a82b3702d67f8f/
>     mips64el |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/1adcb85e617597b7f3da1daa1a064aab1d4b0d9a/
>          arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/6b0c85102ebf72e2a5e167c6db24e64958a1f6aa/
>      sparc64 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/c0bf1a5e299fc3f0d1cfde5e85fbc9f14610837d/
>      powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/bc2b67695777cccd60716bc3d9d29f311fa558da/
>      powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/8c6c9d98eef69edd13c6869a71c7786791be4f7f/
>     mips64el |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/d2a1bafa4adc6f00bdb19376e19044e5ec451bff/
>          sh4 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/9f5897a4e9805676e64d6b11a98815eb040e3231/
>          arc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/8faf2e8fb00f36c8d85f1f5d997e2dfe0468fd8d/
>       xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/79063e4c2d8cada51c3d112e9dfff25c798c6878/
>          arc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/1f4f00b3920aadfbd4d8e976206bed44bf4aa8e1/
>      powerpc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/bba35acaf451e9912d2601d1800c2e0d2dc2b1b2/
>         i686 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/ed90d8b774d8f5a7c9d0294e4e19e9cf47853542/
>       xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/3104387a85bceb34a8a7bd5f39e7051b8eb94b4a/
>      powerpc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/c92472e7ede429992ef0975fe18e433418f7a452/
>       xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/56d9068e8396e6c3c7e1579cb7250360a032e2e0/
>       x86_64 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/fda4cbe2d8a2688a99370afcc0f2b85a01bde633/
> microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/b974034a0e218efe08155daeb9937a3e16c4109a/
>       mipsel |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/b3d79093caffa7a79542810bc4a80c69c5dab862/
>     mips64el |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/511f359a27aabe8618f0f3b90db6a021c87340b4/
>          arc |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/35304cf987dddd07523fa362856055624736fe3a/
>       xtensa |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/132fa320d407c7d601713f579448f87efb2b7078/
>      powerpc |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/2cc88bb6a13e838a83246b608f57e5a8d1f97afe/
>         sh4a |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/42daddb7e9fa5d3017619554bf62774048c3c81a/
>     mips64el |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/a7a9ce9551b912a3a4373317df18313c3a88a04c/
>     mips64el |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/2f66f5741a72a435181a36962bd0ae6c690a9bf1/
>         i686 |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/da774f81766364b0a3e11b6ab24092c0c79a42ed/
>         i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/3771d576b9a801d0751416794764a76f5ea031d5/
>         i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/4b2ec11b41ce8b49b9c1dc61b46ca4c2e9562f63/
>       x86_64 |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/3191c1d9a1f03e978513c841454fa014d4c8f4a3/
>       x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ac41683c8b5b485da7c8b8f1ecb295679d8d35b3/
>          arm |             kodi-15.2-Isengard | NOK | http://autobuild.buildroot.net/results/f133d0a79ec9048cedc67cfd3a0503d546d31e44/
>      powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/c218e4d94fa3f2db79aed8b3fb12b14539bfbc58/
>       mipsel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/af6a215d2022d78515194da92f41e29d50135793/
>         sh4a |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/3c843d3462678e701df0869190409662e812b108/
>       x86_64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/5aa3ef617952ab60a6507cc0c7b1699bbdbfe718/
>       xtensa |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/c7713f9a577560abfb1cade1a7dbc00f33a23a94/
>       mipsel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/721b4a543c9e435bd61d5ca2a6ec5016b54f7100/
>          arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/c63cb4c94591f210a5e9e8f892e824125c77f478/
>      sparc64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/fa5958063d54e75e387331184695c4a2b11b648b/
>      sparc64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/ecd3bbd735fea73bf05745a9f7c61ad6f504613e/
> microblazeel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/fc2e47dd3dfcb601a5e49885ac053c7f4ba5ded3/
>          arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/7278a9b5eb50b39f15158f2776dcd0fc6efcf51b/
>          arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/c682d52d0ecad670c79dca6478975eb8443e5bbe/
>      powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/aed82d141eadc990f9e05d18877ad628aca834d9/
>        nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/0748d154cdb4754fe73c795d4afc8d58d4e4e96f/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/7a97ebb82027b32981eabefe7ac2a0e3eeb931d6/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/7b28da2ad18d3dde6307d2abea632c0e4e647055/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/5481d144e8368004b708f0b7dc201ee2ec1e1805/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/226f0cc9a8be23c7ba9c42c68b6e7a21a6a38316/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/69290337960041b6f97b0f77e9c2eebef9f9fcd8/
>     mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c686a0096a3a776ed3b77acf827c4fcf700511a7/
>      aarch64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/907e87fbe4068ba578d765206b35fd7090faaf2f/
>     mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/dee6b69baf58ca06631a9784289b5beadcac13b0/
>       x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/736fade79a88a523e5fb070f9894442908d969c5/
>          arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/31197f2e9b6767fbf8ccc6febd5115f6adfb6810/
>     mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/12e23bd6bb289cbbbbe1430546fe509988708760/
>          arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/f935b74d2daa2e8653e95028a6370fac58d1f3c1/
>          arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/e201f6ccd73e1a01640bc6f37a1aae7356733be9/
>         i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/fc5809afff490daeebfd55e86ded626015d26e39/
>          arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/7f8af17139fc2c3525dfa91e1e2cbc2fbf45d81c/
>     mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/929227dea38191965f3da5a566badc6125990098/
>     mips64el |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/eaa9c911819efdcd4ee17b34dd12856d90b91466/

Fixed with http://patchwork.ozlabs.org/patch/551321/ and
http://patchwork.ozlabs.org/patch/551322/

>       x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/79c7278231dbf21e46b750347465bf67a8c253fb/
>       x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/6e1e9b74bcadddf12b3d0682c5c752e9f0a1b7b4/
>          arm |             libopenh264-v1.4.0 | NOK | http://autobuild.buildroot.net/results/d2e01b1e4efbf74e611c037674e96034e6e3986d/
>          arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/e7012c7a734dbdd1c697cf63b6df6e834e8eafc7/
>         sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/4185c6c7913d831e2f064c32da9c1a5df9ba655d/
>         sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/03948337c5b1eaa026fcdee20d714b3936f86379/
>        nios2 |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/3eabcd0cace3c672b1aadacc4807917b992415f0/
>      powerpc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/6f516c9dcb2bd22d4c6dad31b31fb39b1db252ab/
>        sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/7de6ba646244711552a9f17c63944bcd04bd2b1a/
>       x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/f27c553d62b690f5213eb51fb81bf77e726612c8/
>      powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/29b1138522cce1dc0cca7e8ef51d93317a986fe7/
>      aarch64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/4fe8d84135dbd7ac8d53ba988c3580f0f36b5934/
>          arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/f2bfec6c6b8cef9e9ed4aa38d506a7f9aa5fc158/
>          arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/544c303179c1489f096ef2cef7843c9d2108cbb9/
>      powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/df5c2294f1cf7a7bb6492a4221f96d73cdb0bfac/
>         i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/48430683b8f64020579baed5ad181e3b436bc1a1/
>          arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/1bb6cb0b0a9d0943d44270ba9eaf24b66bff9d9e/
>          arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/e1233c49c5fb5e4c2b8504b7de4745a87259e14f/
> microblazeel |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/3eaa066543a5da6a0431c507b341b1ad51b99998/
>          arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/73d0859d551385019eea3b1e7318d0592b177585/
>          arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2671d54875795a9b1adc7a929f97be430ac44d28/
>         i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4fc268ebb2f774f2939c0bfd909c9da80212a57f/
>        sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/99d9eb7bd363a4891bd13d4247d4918340efc859/
>      powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/419331e6b9775396c2743de595bb98f3cf45f14b/
>      sparc64 |          network-manager-1.0.6 | NOK | http://autobuild.buildroot.net/results/8a2ed4f1e20a04d22eb35a9f90b68b9f529f0e44/

same here

>       mipsel |                   nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/faae16b543e146b230256d7653d181fb895c83fc/
>      sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/3412ff8ef3ba14cb177b9465db10e9191c7c880f/
>          arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/92f2cc44be2e70a220b79289d6e61e1b4d581273/
>          arm |                     php-5.6.16 | NOK | http://autobuild.buildroot.net/results/6d417790d54cc2575122d255e1823bd480e96298/
>          arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/71e78dcd15ae3fbcb45857971d99997d531e75c6/
>          arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/27a5e12d6a2070648c554bcff83b14c7d0bd9576/
>       mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/aa16f04d8b8903745b52c054875c371ba670d1ec/
>        nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/a17ce9ce71c76063ddf60505fa6fb5bfd4095c79/
>         bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/a4b3c8f5e282eb547c2d10275b633bb6517223e9/
> microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/ff0f105009f97171d23555a831b4d952986e6f8a/
> microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/61b39698777e0af5c088ff2aa6f816ec51e89ad2/
>      powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/5976a3f185812884636e260d7888c6aff0cb1fd0/
> microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/92d4ac4ac8d511db40e1073c00a55ad4aeecc9b8/
> microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/99e5e211db720ffc9dbb81e0c327a9325184c15b/
>      powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/b92b8a4c59d4f432aa19ba98a6e47f23f6bc44d2/
>        nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/d225bddef9a19669cc48a40a81566087c134edc9/
> microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/3b67c99b0fb966b10946c40ae2a4424efc4af1b5/
>         bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/884492a855dc9fa9c47dba8f389308497e4a1347/
>        nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/31220c2cc695266446c105f822a0f966bc50117d/
> microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/9f94d884d2b04c8cdc4343906f476ca85850a774/
>        nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/1292e897575e6f3560b0fe93211093a9d0613535/
>      powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/88c6498db82dc26a7e28ea8564841fab9ad27fff/
>        nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/f376eb944fe57ce95e5df15d41b1bec101955095/
>        nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/87b2f7bf628808b683858bf46054e2831b4d7795/
>         bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/fc9ae6ce2f48ba12f91608cfc42b399ecdcecd7a/
> microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/8a812c5958df698aa26873d0147997f9813c1f6f/
>         bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/6f05ca8a805d20223fa049c6bf9f2435d10c8682/
>        nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/a20b97f0034b43dc062b9f16ddd8cfe6d8c7e5f4/
> microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/93ede421abee07aba073cea2b3cf798401d8fb90/
>         bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/66bf35bc8426642d72857601092806c3c4971d11/
>         bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/dc934be9de102a101b2310394b7651df323a7043/
>      powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/73f095a43fb517de77e3a1beec3364791228a83a/
>         bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/02131e474e1200b75e5dd6f280aa7b1132e11868/
>        sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/af076276521b9976125dd5bdbc60944205810fcd/
>          arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/c56d67b75358a210749f8465d90bd507a3d80904/
>      sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/13d3b58d729ee60250c39a9e8cadab6de9319cc5/
>      sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/59ab73ab1fd0918ad4309d89355c5b1c2c3aa305/
>      powerpc |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/03010085ec7ea0892cd26739bc549f80457ce80c/
>         i686 |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/1f72f26ffcc62f1691211e9df0fee51ac8a07713/
>         mips |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/bb256f8cd042a1e7b711c3d35fce011aa3231aa2/
>         mips |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/8d8c6efe790028089c37f8f7b79ec8130bf3fb6f/
>          arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/fd5e428cb188ee160d4562cd31180b3c69240ed0/
>          arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/2dc27b749659c7b8643be94d7bb5300ca0972156/
>      powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/32f818df58c548c180848136182a9d2b59b05d4b/
>          arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/9045216955859e8bd347e47ccc5b927217248bc9/
>      powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/6e77b88de5d2c9b4dc6ef4de028380e5cf7afdf7/
>     mips64el |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/2c1fbfff6c3b215bf6a632602d10e754f84cdc2e/
>          arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/daca41410b3432c8a326a2e9cb48cd459972f0c2/
>          arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/56218c051bff838e63a8881402fb81fa0e4b1db9/
>      powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/f60741ea904239efe35d9b50e6fde5d64c5828ab/
>          arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/c82c65f42d609becb257806970a8d3e1b9ba46cb/
>     mips64el |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/357b020d1d9f956bd4e93974e75e5def38f09121/
>      powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/c6f79de21471734130fc7e861e68749e5302c5d4/
>          arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/1bdc09af833f1fab3fabee48521ddbe603268823/
>         sh4a |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/0222465721c399fe4d991e347152460579836aa6/
>       x86_64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/d11856f52c6e8cb5a0920d852ec19709d93c9503/
>     mips64el |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/ca86fc75c387a1a79d9371a4c8c9f48f3931ce34/
>      aarch64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/4f375a59bc29dcda1b586c57b4a22fb78d7e1a53/
>         bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/07021c8bd6e2031c2717fc58e2d3ff30c412fa90/
>          arm |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/8a18f5287eff4a5e1b010679a18872a5df9aedd1/
>
>
> --
> http://autobuild.buildroot.net
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
