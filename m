From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-17
Message-ID: <20151118073020.E7527102554@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-17
===============================

        success : 197
       failures : 67 
       timeouts : 1  
          TOTAL : 265

Classification of failures by reason
====================================

                   mplayer-1.2 | 11
libbroadvoice-f65b0f50c8c76... | 5 
  toolchain-external-undefined | 4 
                  ffmpeg-2.8.1 | 3 
                mongrel2-1.9.2 | 2 
                      qt-4.8.7 | 2 
                    ustr-1.0.4 | 2 
                  connman-1.30 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
            libserial-0.6.0rc2 | 2 
             util-linux-2.27.1 | 2 
                 mesa3d-11.0.4 | 2 
             lttng-tools-2.6.0 | 2 
                  gauche-0.9.4 | 1 
              libethumb-1.7.10 | 1 
                     fastd-v17 | 1 
                directfb-1.7.7 | 1 
             host-nodejs-4.1.2 | 1 
                   mpd-0.19.11 | 1 
             gstreamer-0.10.36 | 1 
              cryptsetup-1.6.8 | 1 
                  qemu-2.4.0.1 | 1 
                    libuecc-v6 | 1 
           libvncserver-0.9.10 | 1 
 make[1]: *** [all] Terminated | 1 
                 lvm2-2.02.132 | 1 
ltrace-c22d359433b333937ee3... | 1 
              gst1-libav-1.6.1 | 1 
 toolchain-external-legal-info | 1 
                      pv-1.5.7 | 1 
                   erlang-17.5 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
               dvbsnoop-1.4.50 | 1 
                 dropwatch-1.4 | 1 
           bcache-tools-v1.0.7 | 1 
                pulseaudio-7.1 | 1 
rpi-userland-b864a841e5a459... | 1 
                minidlna-1.1.5 | 1 
freerdp-17834af7bb378f85a3b... | 1 
               libnspr-4.10.10 | 1 

Detail of failures
===================

         arm |            bcache-tools-v1.0.7 | NOK | http://autobuild.buildroot.net/results/d299a9dccc53b56f2dbeabedc76feba63420868f/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/a2b3aaad1f4f2547217b75c4de4a5b5ffd4e19e3/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/a2b7330a9a07556a1c5e779c3d3525408cb61b85/
      x86_64 |               cryptsetup-1.6.8 | NOK | http://autobuild.buildroot.net/results/82ff5b362484b96157d1282b89375cc7be83f0cd/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/164de0552d80ae4f02f2ea7ed7819bfa0a04e8b7/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/70eabe7b8346c118e3e49a3e538af6e734e38016/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/3da3e853d76ab9b971f0209e98339f5fed42967a/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/580ca377974b2d40489e2af734768237084cddbd/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/979d4eba18efc0c7799424dbcdbddee74b3a2e71/
      x86_64 |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/ed4437bed01138380cd42c0dc943cd3ec85e26f0/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/0a1b9248855c2f9a3a81ffedcc7114c2edfb6151/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/b79329e03fb6db676f9cd2ed0e172685c8b78cf5/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/0894adc6e6d202daf2bb3fb91c39cf9eab59fc59/
      x86_64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/572c6df975e276bf1fffbfc81d2702fbaef6e9f3/
         sh4 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/94f596702906f94278ea30a0ce49ad56506ce405/
      mipsel |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/cb96a1f068250ef2eeff0b62e5e026b0d29a7b26/
       nios2 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/f8ba30408b5ce15022792e823a0c8fd3a004fb31/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/a74580bbf80c946c1ab11f78e29a4733d8c922a1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/373cecbd0c31e5965eb6038d6f5fdf5219e2f9d1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/90a9493d8aaa357779fc43ef0448f49ca87b5e5f/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/1ed29736fb6626a2b66907bf892d9be3e000fef9/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/6af6a6d4fd08682c034b7d1ed58860ead5dc758b/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/441d8c61dccd9e72015b733eacef8f1e7e5d84d1/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/1471f8a4838369ed825da406f88aae425465e827/
         arm |                libnspr-4.10.10 | NOK | http://autobuild.buildroot.net/results/7701730895ddfd20613c06e451792fb4cea3e9c2/
     sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/f9bbb8a6636cd3e3203b059f627aac7b1d511eb2/
     sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/1be9436d4b958bf25df9305048bc7823df945453/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/4a3a4a3d3e4f2153ded4cbd41949e34063ddf5e2/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/a03846bd55e0f378504b9cbd8d6a674fbf122712/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/2acd745f4e5ec6edfd09afcd57b9ece216724c1b/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/d00c6bd400b37766742b5746ae71dfd5ac5ee271/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/49e0369233f6b30313be661878e1098a6d9e0efe/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/b11a3a5a3dc7e807f0fb30b20793e26739af8001/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/899854a0597f8275ee4488be03332fc7e1d45f76/
      x86_64 |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/304eb83d3eb3723953fc66e019d04e4ec39b14e5/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/7dc4ab759dd3b1e3e03fe52c78e31327340bf8c9/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/d892133c2f99b8eb6e538d875ce95aa7784d227c/
      x86_64 |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/2cfc7a1dbce69b6f9310dbc55f8557b98f330444/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/6b10e6a4bc5ec18c6f73661c0a6ffe67362e0007/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/f623703aa6d7992b67d305331734e4ed0c7b2be4/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/eb385cb4f87078122028e85cbe31caa01d794991/
         arm |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/10bd00209f098e8782016355cb2f46d1d3e7d3a3/
        mips |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9ea10ed0aff338b8a304638b6dfd510b2fe73c5e/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a183f1289718caacc232d8f136afb8cfb36d1817/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/27acbd6470a0e8510549167f01b5b163cebdad91/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/aa91b29f9998a02abd2628bdd051c08a5dad45c4/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c0c21fbbd1c95534c44cbf78f702bec064a8c09e/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/25570df20e898028180be4c0fc6fd2f31fd5a0c7/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0ec2fbb137ceb0fde1556b780a431c2dbcfd14b7/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/498efecf0f87236d4b1c755bc2582e11f8f56bec/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1c7ca0d1eeb2353177f2d83e7eb88ee922f0279e/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9fb849797af330b81f4487fc7c656adfeef8abe9/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0e7a69d6f16503b64314ac48b0265bfd33b563b7/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/a1e7e59f9c65a6ce38800439c78b7808048ad708/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/ca5db5950a200f6b2347cf8a73770e1e04ee1592/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/9a7211e7b40f5a08fc50a912663d53af515896a8/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e4bcd715d82e1909e9214eee3cc41898a41136be/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/efe1273464d18fc2111088c815997da77f0186b8/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/3e675f4ac074ea8a3100fcaf7655ec78cc2c703c/
        sh4a |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/ab490de33e0720f15060fe1ddd868bd4186a0a9e/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/15e86ecb764fcf14595fc06f46fa29ed26c01e3e/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e69009bc1fc87d6995448571a37bfc5c2112f525/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d74605f23555f77bc6422c62222cd25c599ac6a5/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/723186809cae8ab8fa021dff7e6b0d5a3d568e50/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/91baa07686c6f8b801186c228e75039c6753c2ab/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/7955a4f5a50ae358f3e887a3ed4ad858f651c2e8/
        i686 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/aec394b8b99bb2136f520b0b4c1802bf103be88b/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/e96cb0ca24657070caa21b8c77cfe4ba65b05724/


-- 
http://autobuild.buildroot.net
