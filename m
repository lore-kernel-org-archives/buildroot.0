From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-09
Message-ID: <20160510063022.EAB531023BF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-09
===============================

        success : 157
       failures : 66 
       timeouts : 0  
          TOTAL : 223

Classification of failures by reason
====================================

      python-coherence-0.6.6.2 | 6 
          php-geoip-legal-info | 5 
                 jack2-v1.9.10 | 4 
                    mpv-0.17.0 | 4 
android-tools-4.2.2+git2013... | 4 
                  ffmpeg-2.8.6 | 3 
                     vlc-2.2.3 | 2 
                collectd-5.5.1 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
                   erlang-18.3 | 2 
                   ulogd-2.0.5 | 2 
                    qemu-2.5.1 | 2 
                 host-go-1.6.2 | 2 
               linknx-0.0.1.32 | 1 
                    ruby-2.3.1 | 1 
                    ustr-1.0.4 | 1 
                 lvm2-2.02.152 | 1 
                libinput-1.2.4 | 1 
                libpjsip-2.4.5 | 1 
               wireshark-2.0.3 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
     python-setproctitle-1.1.9 | 1 
       gadgetfs-test-undefined | 1 
                 lvm2-2.02.153 | 1 
                sg3_utils-1.42 | 1 
                flannel-v0.5.5 | 1 
                oprofile-1.1.0 | 1 
            lttng-libust-2.7.1 | 1 
                   mplayer-1.2 | 1 
          sane-backends-1.0.25 | 1 
             fxload-2008_10_13 | 1 
                       unknown | 1 
            gst-ffmpeg-0.10.13 | 1 
                  psmisc-22.21 | 1 
 toolchain-external-legal-info | 1 
                grantlee-0.5.1 | 1 
gmrender-resurrect-aa3d02cf... | 1 
               valgrind-3.11.0 | 1 
                  connman-1.32 | 1 

Detail of failures
===================

      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ce674b7a7f676afd11766f3c8befe4fdc8bb5ade/
     sparc64 | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d0b330140c30b01e06d8fe5bb1cb252f4623d97c/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6c99d068bc73c224e4795d116b57cdc35c90e57c/
    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3552a6a79a83fb0aa7ddf41ff76dece6d54eeb15/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/e2a97e50b8118c41cc01271e0d0ad5287c06ee01/
     powerpc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/7f79c16a9c30c7da05e890ff83fafa65d43d4320/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/4eb25afed253f5410288995cdcb098b199c97c74/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/b970f5f614deb8e0f4dfc2a6f7948cc9a2dd80e4/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/e7620d0ba1d382305530c127bb60f26737bb85d9/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/64483b8dd4844ed7760ffe394346373e595e7531/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/50f0f92e3089a60ff1fb6d96afb1606759871055/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/1faa10b7b7ea9587dc716b039bd8c77f05848d52/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e364bdc5469443570915aaf5626b884e44a67705/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/4d9d8d67c3771cafe1a851e97a349d917272cbff/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/ff9a3768829f2b7412fd44078a99853bf4def85d/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/a6cbf4c35c1709632033e9e860470363d3e1be97/
     powerpc |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/5b37ae5011e2baf1efc652c44e5ab830f3ac433b/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/6d737334a30283ecd8e0801c6eeb7959f2d8eb50/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/5aaad26ac5a6b03a5a26e81e5edff2535b4990ca/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/014213d789096480ab64b0632ee6108d665f1b9d/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/625dbd61b42369cfd1d2f7f94f205759b7ef6f09/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8cb6a9495155de5bea5bcc33105e2860c9549481/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/354fcaba6d1a32a191e4c717a2c0b971c0eb5b21/
         sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3353dca2f5b8cc54c459ac7e3865436cf38eb347/
     powerpc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/056752ff6e96935f8785d489e14e7207f5cb9601/
         arm |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/e36de9bcf2d1716c5d1e647d30007f9eeaee8f5a/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/bed263dfe05a6c964ea0bba7b552ffdbafac0b5d/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e54d169d77fda9a72cf709d81dc82b648d7a11cd/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/87012c647fe6637e635cac46b2535dd6c95fe2e9/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/276409200a19997ef883b53d1427ac65084f341d/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/ff459bbaeeaab0c0438a77ef66e7a9863796255d/
      x86_64 |                  lvm2-2.02.152 | NOK | http://autobuild.buildroot.net/results/669914843389341662193078ef0169b0d00a2e1d/
         arm |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/c62580315237fd7b771d864158432b714e111871/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3ac170c5b06d9e6bc96374fd0c28d436533df946/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/1e63045a26e174b5db274d1c39d839a89c96b2e3/
      mipsel |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/3906cd59231870ca097193c458697d251993e3e6/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/852f22d607766de5789598f7fbed79dd200ba345/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/1b3fa6c01f0b22c8454df8c25c2250e0ee6ebbf4/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/3bfe9918e074d208b5d5ecbc53697f20f5f1d215/
    mips64el |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/b6b7e2ca820ba20fa81e4700e46f349e5f3297e2/
       nios2 |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/d97f9907fb1d0ca4654e5309e77886aa829833b3/
microblazeel |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/638caf09901d40958ee93962c72ff4fbdf30ebe1/
        sh4a |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/0bcfbb636448f5d3423edf697d56b026c21c5fc9/
     aarch64 |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/752bd9a8a3286049fc55c72641dfa3cd8ba32682/
    mips64el |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/d7450105b5be85cf6ea9d42e3300b1d2079944f7/
      xtensa |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/4d94b0f37b8e6a06e107be2931fd2d5cee851962/
      xtensa |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/ffe15da0849d03fc300b767b91b7907c94719568/
    mips64el |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/cf4057038c44136d1487851a4f043db131700380/
    mips64el |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/e0caeaf689d2cffe178dd803d94af0b18ce72da3/
    mips64el |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/725801bfff7b1d70e9b0986dbe5e4e9d706811d0/
      x86_64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/cd366cd2c36208a6e979f93bda32daf39a0fbf0a/
      x86_64 |      python-setproctitle-1.1.9 | NOK | http://autobuild.buildroot.net/results/dac6e291dae9f42d71f1e9de6cf0362d613b2d5a/
         arm |                     qemu-2.5.1 | NOK | http://autobuild.buildroot.net/results/19b863d1339b9972d02bef857d20cac8f5037da0/
         arm |                     qemu-2.5.1 | NOK | http://autobuild.buildroot.net/results/5f8f938b2dee904baf601faf8ebf8df38ebe74ca/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/9a0ea8575270e78b91ef404a78e464f357a1b048/
        i686 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/9bdd4af660122b9fe1902ab9634146438e8eaf3f/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/3431ebbf4d1afe639f2c4a8df57c7b9748e2b63c/
      x86_64 |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/07a14d42565c8b69337480a86e314d1ff27e6e9c/
      x86_64 |                    ulogd-2.0.5 | NOK | http://autobuild.buildroot.net/results/e63dc2335e99100443176c396824fd15dd88d56a/
         arm |                    ulogd-2.0.5 | NOK | http://autobuild.buildroot.net/results/3fd29096b7e8eba3fc36b239090cbb7faf66e007/
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/dc701ab5b54fc2ccbc97e5a31f972804591b72ec/
        i686 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/38900db68726f60bfec873274dec39da82c831c7/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/69202940dafaa4af685f3aa0ac59cbf2a01111fa/
         arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/034eeafb44d62ea6f65a7dddd11e3d95e31c9564/
         arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/db7f940cb44b0535a07b8ed2bd6682845b20e4f7/
         arm |                wireshark-2.0.3 | NOK | http://autobuild.buildroot.net/results/f70d5897328e82520ea10e7e9c1f37ff6d041acf/


-- 
http://autobuild.buildroot.net
