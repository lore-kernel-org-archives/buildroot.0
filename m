From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Sep 2020 07:13:07 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-26
Message-ID: <20200927071314.33CE385D68@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 33  | 13  |  0  | 46  |
  2020.05.x  | 33  |  6  |  0  | 39  |
  2020.08.x  | 23  |  9  |  0  | 32  |
    master   | 138 | 104 |  0  | 242 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 21
                  boost-1.74.0 | 9 
              asterisk-16.13.0 | 6 
                       unknown | 6 
                  pango-1.46.1 | 4 
               target-finalize | 4 
              alsa-lib-1.2.3.2 | 3 
          gst1-devtools-1.18.0 | 3 
                   guile-3.0.4 | 3 
                   libcap-2.43 | 3 
 Makefile:753: target-finalize | 3 
                 ser2net-4.2.2 | 3 
               apparmor-2.13.4 | 2 
                   attr-2.4.48 | 2 
             babeltrace2-2.0.3 | 2 
                  ndisc6-1.0.4 | 2 
                rocksdb-6.10.1 | 2 
                  zeromq-4.3.3 | 2 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
brcm-patchram-plus-95b7b691... | 1 
                  check-0.15.1 | 1 
         conntrack-tools-1.4.6 | 1 
                cracklib-2.9.7 | 1 
       docker-containerd-1.4.0 | 1 
                  ffmpeg-4.3.1 | 1 
  gobject-introspection-1.64.1 | 1 
      gst1-plugins-good-1.18.0 | 1 
             host-cairo-1.16.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
         libcpprestsdk-2.10.16 | 1 
                log4cxx-0.11.0 | 1 
                  monkey-1.6.9 | 1 
                   ncurses-6.1 | 1 
             openswan-2.6.51.5 | 1 
                qt5base-5.15.1 | 1 
                 ripgrep-0.8.1 | 1 
                samba4-4.11.13 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                 uclibc-1.0.35 | 1 
                    vlc-3.0.11 | 1 
                    wampcc-1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/51a9af6966d87dacc25103c5a0d76e1ae4c81e38 |     
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/f8528d568de0dad751129900ae38ae292d7567b9 |     
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/5f9d9601084863d0f17acc02b73f982bf2d18730 |     
  aarch64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/d3f2f2a681307c42cbe52b4cb92d6db07d1cb41f |     
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/5d390e7f39a99284500be28b70122bdb7dffc258 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/92d89176f48704c0c9b77ca9b1f644cd2390a161 |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5cbf1cc14b0a0ddd0cc3939760780e7c22b35c1e |     
   xtensa    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/6df95771f666c3544f741a284c91f240669d4d55 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/6270c6fc5812bc295cbfe8b93d531bd3a30f1eb5 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/ce7caae8941f995bb092a5d148c34ffd0c0ad83d |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/9475d5abbd858ec52358841e4618677a844ba0b0 |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/253a85deed9d8148986975bbf2d9fce158ef9a1a |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/16573a0e095b0d77acff908e470ba8d81f2392c6 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/a6c773070c68d7c92ed6bb3a1a0dfb9a00cb804c |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/e4229e2b9c892b419a9d2eaa6929b80ea62dd130 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/79edc54ce97a9a7a3d47d4603ced683b8fd231a7 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a95c6f7cc09fb1f5ebc070ad64bf44cff8a3d111 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/fb818d789a8d3e7cae9ac6b658c13490f707496d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/e97525b00395963ae8fc9469956dd57e12091fc7 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/2ba3308733e8fbd1fb301449d63f6a375b3b4edc |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/e9f42561ee82dad55d7d1ff19c9610f7be4ab928 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/4884f710ab9d66441ba3ce38b695f30823ef8354 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6b2a4c78d5658d32cdb3d7f21dbc2d9def6c1571 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/881e177d1978b6b9311bd22b79aaadfed4d93138 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/bee018de43046241acff1f5c5eb8ee806488c3af |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/9bb7c0c36250d7c408c23d3722e67ffedbe01dfc |     
    arm      | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/f4973f7b4869c14a02df6e0cc99adf498f9a04ec |     
    arm      |          check-0.15.1          | NOK | http://autobuild.buildroot.net/results/72b6541733db6c1dce2682006209e6423568f4f9 | ORPH
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/095634245c112f3f14182886b8db472015c66b7d | ORPH
    arm      |         cracklib-2.9.7         | NOK | http://autobuild.buildroot.net/results/c5f8f2da277d029b50539d6f77bdcaf04d8fd932 |     
    i586     |    docker-containerd-1.4.0     | NOK | http://autobuild.buildroot.net/results/ea671306a1089c5437b7c89a37596630d5792bfa |     
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/525b448b5bc05e5913f0f0b7a0a28e5fd274ffd6 |     
   nios2     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/6aee3c853622db8fbcd07b9d52674af05f1310e5 |     
  aarch64    |      gst1-devtools-1.18.0      | NOK | http://autobuild.buildroot.net/results/8c76417a2a70780a1b5bc87318de07de027a19a1 |     
  mips64el   |      gst1-devtools-1.18.0      | NOK | http://autobuild.buildroot.net/results/427e6d6d5c6050f42eddf5dafd301f7317dbbf15 |     
    arm      |      gst1-devtools-1.18.0      | NOK | http://autobuild.buildroot.net/results/7ce1e6dbe17b1467c72f3b1c92907b79abf5a25d |     
   x86_64    |    gst1-plugins-good-1.18.0    | NOK | http://autobuild.buildroot.net/results/38ea1482a563b5c2deb6eabe7f283dc0be30f704 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/870c9f17f25e30625b08cd2704bbf8c470a07d1c | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/bd194c850f096f0478abb8bbcff1c3b8bda589db | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/5323c7f58a60b5ffb75e156144e185b6e34a8946 | ORPH
  aarch64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/564d6839153c559b800979c5c73780067cfd6a44 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0178e2f4fd7bf33b9c726eef7f6b26c18149ddde |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/02856a3e8ed90b0485895a94cfcf36cd7862e30d |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7588e074ef7950e7f45e67040241eeec644e9d1a |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d85008229118303b4826902722351e252a1b2dca |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a4cb3025e5b0e24b05e640e258d7ff632fd2a249 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eeaec95da0e4fe113af5f0d3f136e589a66fb0c9 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/829c71e09e884f00cb85867ea3f2802c5647bca4 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9a851615e619d237938acee84124e9a19f361863 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a542e4176bb27377422851c32f2da9c502934ce9 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/33882239d5db3d4b070e1d3760e5187a50fa7653 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/684c89e741a04abf220596820e741a4da8c1d829 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a63ca8e7b4207fb1b8e600f0f6b10425b5f2b885 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fd2488b0cc0bd1f7a29f45248a57b00a76d75610 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b0d7fbc9c51a0c5b2da677f3b5e2e01cbce8c2eb |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/da5a8018b3bb1fd05e2ff118d82c8c7b7bd725bd |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e9a41f526b7d0382ba15f87e8005b4bcf8e24f8a |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4538992eededaeffe6f1f20f52ddc53b0f56aef8 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b217547741999915f0d6c756c066b493d3472a9d |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5edefa3388421b08cbbb0b016b181ff4b9cf01f5 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ba851a387ac5a5cc4c57298bbe401c5f1f9d7113 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/91955d0d0e7b8abfc9831e03b949928c4f44a6be |     
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a04b0da9e32fb4b030676896c6fa6cec17096b79 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/905e8e45ee82062f9d8f4908d73fd622cc704cbe |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/4e64be90c9f15fb64359ea1d8da6d7348a47f36f |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/92fbfcdf86848e533ccf9480aa763c10ca7165fd |     
    i586     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/07bbadd96e83b2e7a2c57e87879a450b76fb42c9 |     
  powerpc    |         log4cxx-0.11.0         | NOK | http://autobuild.buildroot.net/results/b41b50808ce38d0352782af83e969fd3914ec0c6 |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/22d87c9d30270debb8736f2a503a678bd2e4b4e9 |     
   mipsel    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/002599bfc4a427cebbc56633b168f2f484ae2e58 |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/a06fc2b29e047b7829f01c3705bb03688a7ed3dc |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d1c2c4e6e10b28a6ec23cccedf3a8b4c9c3aa5f0 | ORPH
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/2fea329c3911f1f2e6089d9dc3dc9648236a7c2b | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c557758d8a56a78f20fcae7a45c9ded5d9a72877 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/24fe50684bb0c23b0cf98f218bde5f06dbb7a9c4 | ORPH
    arm      |       openswan-2.6.51.5        | NOK | http://autobuild.buildroot.net/results/cd89ffe753ed3cf57373849086ebe5a1c07c44c6 | ORPH
  aarch64    |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/fffa00507856deefbdb5590ac47105ed144c531a | ORPH
  riscv64    |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/625daf3092b786fe03e9e2b3450722b45c7d13ed | ORPH
 powerpc64   |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/c42cda0d8be1bf43dd9bb7ac093c4c437f156deb | ORPH
 powerpc64   |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/61e2444f7b641fc8e5d4ca4f3eda88e0e5b57ccc | ORPH
  aarch64    |         qt5base-5.15.1         | NOK | http://autobuild.buildroot.net/results/3c05e597c073b823f8b091e17b676ed3ecf6b5b3 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/6751938edace29a35b2d28232b26c81b34a8c59b |     
    sh4      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/f548fff009a34d17d2ea9797e91cffa59f4815da |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/4d47baf6af4402f39f082c97dbc3682170127997 |     
    arc      |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/82317308702a8c5c52902e1eb37e2c746eb37bae |     
    arm      |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/5ab40cd6fec4b5d0e7497bc416c0768204d03502 |     
    arm      |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/4c0b238186cb2fb2d81807ce006945594f92b2cd |     
    arm      |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/2f8ea4d18d43c1dbc9d9905691bbfff77b0c981c |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/03efebb8bd36f17bc61dd443218596cb2d35b601 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/5d843f8364e04d860e7f8d624f00ca60568b7d38 |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/4afdc500f7e9e7dc253b45af97ce88af81c4a5ac |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/ede59def582bc64030fca5495285a4814babdbe8 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/a59ee723bc37319fcb751022fae4decea4c96a91 |     
microblazeel |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/5f0bd7e1dc3239417c47539b92c7322c4addfc90 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2d60343411e34224bea7eed97677f7c17fc7e6e6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d0bc7e7b0792d04bc1f0523e63023a17802988c0 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0524f74aa241e58ae394e4ff52ded326063ab998 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c8a832757c11dbde699efc42bd28e54d07bef58c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/669a73ecec3076f94d344c6d2983f7bd4b3682d3 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/498e88391e298ef109cf308d731182964f8c3cbc |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/44122b8f4b7dfea5cc063cb45e5069cc4caa7c13 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/753a1bf460d98fd32457ddce8540474c9906be55 | ORPH
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/9c8ad24fcfa8a9cbf2ffc299da78fb11125f1391 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/1103fc2f0c76dbb47b0afd0202ecccea20db676b |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               target-finalize | 3 
                    vlc-3.0.11 | 2 
              fstrcmp-0.7.D001 | 1 
              host-grpc-1.25.0 | 1 
               libdcadec-0.2.0 | 1 
               libupnpp-0.17.2 | 1 
                    mpv-0.29.1 | 1 
              openjdk-13.0.2+8 | 1 
               protobuf-3.11.0 | 1 
                suricata-4.1.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/8ea055ee8f9559c173d1fc79871e2b48cc840b07 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8221894fced14efb88048a4e2fffb4eb8dcca093 |     
    m68k     |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/9f1ffa2577c4c8af7873ab76106d2e9dd4a65a6e |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d6ccc6cdbba83de81ccbf43241731994f642a099 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e627cdf952ed98e77df341c33231da1e38cb89c5 |     
powerpc64le  |        openjdk-13.0.2+8        | NOK | http://autobuild.buildroot.net/results/6a7a189bae76e2eff2dacb01cf5f8ef35197ff14 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/cf347facb5234fce5aeb06e4badb35a131015320 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/ed66e572c2aef9423bc9889af616e205282d95da |     
   nios2     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b0e085ac4d1e955433bf8eb6575fa8e2741a8534 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/58104653aba1d9ac94f390ec80647ccd393e9d79 |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/79f75966c4b8ada4f965b090e052f3710ba595f9 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/f428fbf6308148ea7c46f427083b245fdf09acaf |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/2dbed1ad1f67e6ff41c361558b569730f4f518f0 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              bitcoin-0.19.0.1 | 1 
            ghostscript-9.53.0 | 1 
              luabitop-1.0.2-1 | 1 
                 openal-1.19.1 | 1 
              spandsp-20180108 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/61683e463878b9421da19d5e776c0b83e102a47c |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/0b9e62a939705197ebb319093865947bc68b4299 |     
    arm      |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/d5bb68fc0bf09fd3b6c11c28dbef2729e52b527d |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/789ca39bff2a2303ee745125f9266310bcfaa4b8 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/0bb5d89fc94f826baa1b730c79a16612dcbf6d39 |     
  sparc64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/a0f1badca01543da7cfbe8200773a04a5dd666fb |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               target-finalize | 3 
               apcupsd-3.14.14 | 1 
 Makefile:752: target-finalize | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                samba4-4.11.10 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c4662f011413434245663b609c97035a897e875f |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/158abda8320c19cfa37c4c449ce5f45f496da5c0 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9939152ea9ee11b8cdeecd8af1a29623bbeb7e51 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4b53857285ca79fbdd16c8395f23ec3d76285e45 |     
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/77e8c803f4dcd6b4b4e7fb4136356ae7b60cb281 |     
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/869b192ed3280e736f2ab4d7564c6be7fb9fed52 |     
   xtensa    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/cd8296e3c06d6dfb439a4dc5043cee89ab9e906c |     
microblazeel |        target-finalize         | NOK | http://autobuild.buildroot.net/results/e32ea41c0e32caff159fc444f571e397466da578 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/fa7408d8d41212f014ebda452da722ec2f169cb7 |     



-- 
http://autobuild.buildroot.net
