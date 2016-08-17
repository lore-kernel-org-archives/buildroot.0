From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Aug 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-16
Message-ID: <20160817063030.3376D101E21@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-16
===============================

        success : 229
       failures : 64 
       timeouts : 2  
          TOTAL : 295

Classification of failures by reason
====================================

                  connman-1.33 | 4 
                  ffmpeg-2.8.7 | 4 
               binutils-2.25.1 | 3 
              squeezelite-v1.8 | 3 
              lirc-tools-0.9.4 | 3 
           igd2-for-linux-v1.1 | 3 
                     gmp-6.1.1 | 2 
              libarchive-3.2.1 | 2 
                 mplayer-1.3.0 | 2 
      kismet-Kismet-2014-02-R1 | 2 
                   fwup-v0.8.0 | 2 
                      qt-4.8.7 | 2 
                 mesa3d-12.0.1 | 1 
                libmad-0.15.1b | 1 
               logrotate-3.9.2 | 1 
                oprofile-1.1.0 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                     php-7.0.9 | 1 
                alsa-lib-1.1.2 | 1 
                     vlc-2.2.4 | 1 
                openmpi-1.10.2 | 1 
             libsidplay2-2.1.1 | 1 
                   lldpd-0.9.4 | 1 
                 jack2-v1.9.10 | 1 
              ptpd2-ptpd-2.3.1 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                libxslt-1.1.29 | 1 
          sane-backends-1.0.25 | 1 
                     nut-2.7.2 | 1 
                 ibrdtnd-1.0.1 | 1 
                 mono-4.4.2.11 | 1 
xdriver_xf86-video-openchro... | 1 
                     pcre-8.39 | 1 
                  rt-tests-1.0 | 1 
                  libffi-3.2.1 | 1 
                  babeld-1.7.1 | 1 
                 openssh-7.3p1 | 1 
        lttng-babeltrace-1.2.4 | 1 
       poco-poco-1.7.2-release | 1 
                    ola-0.10.0 | 1 
make[1]: *** wait: No child... | 1 
android-tools-4.2.2+git2013... | 1 
   binutils-arc-2016.09-eng008 | 1 
utils/CMakeFiles/testpat.di... | 1 
           dmraid-1.0.0.rc16-3 | 1 
iputils-55828d1fef3fed7f07a... | 1 

Detail of failures
===================

        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/feff79c362d327cd5cdf357534d77dd62a1ff276/
    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1d02861ce1c70e8a94ee91cd530105d805744eb8/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/9409edf348781341e294084cef317e76cc283b06/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/a23a2e394ced18fb42829994998a9e175ced79f0/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/196993eca1781cd7622d01fd066d1202cc765b12/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/f9e9d1d047d233311fccd13761f1f17a71fee9d0/
         arc |    binutils-arc-2016.09-eng008 | NOK | http://autobuild.buildroot.net/results/28cfc0d2bb1dc2d64b97a76a4cc7df808f0e2f41/
         arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/c9c8190c8fed0234b41848461fcb7796342daaf2/
         arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/9500d2da706ba7537dc39e3056441cf9a71d8a18/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/25fbd71b2fe5192d5a0b393393362daa5e78d4f1/
         arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/b42f1c07a01eb9083e4bc8bb5f1349d05fe60dfb/
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/bb769c9eb1b11ded9e1348e3fb08f3f1988255b2/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/d0abb050500f0a1797a73424521e38e3b6edc504/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/dc631d427fd770848c8ce9de8fd27f2256ba704d/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/a7f4545c005f6f132df3b9a4bb41da68ca822aad/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/7588f5d1f2efcad2fdcd12402cdc3350af632477/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/b8f2cc2b829f8eb5b584bedba5f072503146dd45/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/befb6cf66cb430e4dbe413f8004237a7527e98d3/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/682f234dff60879c30519ef88bd9104b25cd2577/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/0948b87d96b4882b8143f83b0d37427aa50a852b/
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/4b150c79d40367de6347236088a65617afe38221/
       sparc |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/0f9f5900365d61cd6eaea8b3c6310ea926ae9454/
         sh4 |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/41d3c411fbe4e089ff9297ae01f82c05952eb574/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/99f96b7537b00917fc2fc914f2fe72cb1fa0717e/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/573c6438b89857cd40886f556a4285b4281739c3/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/50274fde9b20cf23a2334d4a8e7703669c5792cc/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/c4a6effc102dd7cc57dae848e37bcbca87f4b721/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/fe6346384a44376f9dbd9dd3e94a9e8ebfbdf6e3/
         arm | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/899d4579b2d849198eb93dc80dbd3544086b74d8/
      mipsel |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/aebc5d11bbdcf0117624f097deb9615f1eaf176f/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/dca5d0a8d3eb3632da9049d0a3ff280188ae62b2/
        m68k |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4ab27301109328d4978fddfee0d8aa85b3bb94dc/
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/76891c175e110e706bf93a559e6d3a12d8b9c774/
         arm |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/c0e187a41efc0f822efe7e642a78a744f739dce7/
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/a47bf0a8c9d6661c80b39855a336a22649a5b11f/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/791228cd5ebf6e5df4d92f691eef31467254b140/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/3840db09409285c84dd1048d94a970f18c313e55/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/32bf6c2756bbb1c5255cdbd0eac1437ca52776e1/
         arm |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/fb15d7729b07a65950d73c6d331f870257aaa43e/
         arc |                logrotate-3.9.2 | NOK | http://autobuild.buildroot.net/results/308ad33ddc46a198cc9109c07739b8d3aef611f6/
      mipsel |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/6e27f1a5f666c5e888690edc8ec8392fa6851f96/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/77516ee767fa43b70fd427513702012dd4ddceca/
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/9fcb4dbfb68758370869a6378f43d6f2ab1e9f31/
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/2f5d1fe485a25f7fa9bcacb66e02823119917156/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a2af0b9ad6a6ce6ee19b19a6697cfa9ebcd49ede/
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9fa75643e42960d5bc4111d799ca707bb2d9d299/
         arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/0c584522c26640e29980150a87a5b5d8c02e5f8b/
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/996fc7223aae03585cad6dd6a7ebf53a4d158c46/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/524a69731851cfa105151d154bf9dabc4b2e2553/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/056ea8fde7d14ad7272ad0dd85d64207baab307d/
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/5e2c3b47517f2a655b59b45d43a5f995d33eab6b/
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/8a880f168be7c11ae29112eb89ffc2222160c5ac/
        m68k |                      pcre-8.39 | NOK | http://autobuild.buildroot.net/results/d311955ada1ffcd7f69e82965c8fe33eabe488cd/
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/3252ecaac05c93fb534b3bd312aca5772e3aa236/
        m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/dff40f72bb15acd2d88c5f6f72e2d9e99b201910/
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9653c510f9cad65cf56c02a9ab66239aa3afc0ba/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/29a3fb074df643746292de3c6490196485462708/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/528ea3cc6a74aa2c9e1d56d5a0977d12e6cc72a3/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/7262253cbbc8671e5fb731ad1f5b0facbce5ebd3/
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/01ccf7681041e79f87b23426986313c709d0d008/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/7c421f3af0c0af4476c822d5e263478c560be8c3/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/455465c332d291929c1612d18a9e7448d9c76e73/
microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/edf8b9d6f465627bd4a953d31e221ad052a8550f/
microblazeel | utils/CMakeFiles/testpat.di... | TIM | http://autobuild.buildroot.net/results/91473e3d0f394a37aa8dd7d41a781d6d69c20338/
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/1cff1482bc68ddc3ec0a6280dd2c0a241e8f3611/
      xtensa | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/5c6296828f3189c847942c0d559d315f36cdf52a/


-- 
http://autobuild.buildroot.net
