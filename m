From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Sep 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-23
Message-ID: <20140924063012.B5FF8100D9E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-23
===============================

        success : 221
       failures : 33 
       timeouts : 4  
          TOTAL : 258

Classification of failures by reason
====================================

                  ffmpeg-2.4.1 | 5 
                minidlna-1.1.4 | 3 
                    ola-0.8.33 | 2 
freerdp-440916eae2e07463912... | 2 
    bandwidthd-v2.0.1-auto-r08 | 2 
                 pixman-0.32.6 | 2 
                 gnupg2-2.0.26 | 2 
make: *** wait: No child pr... | 1 
                busybox-1.22.1 | 1 
tvheadend-ca742e00a77177873... | 1 
                 gnuplot-4.6.2 | 1 
libshairplay-139d5ef5556451... | 1 
              host-erlang-17.3 | 1 
                  opencv-2.4.8 | 1 
checking for strerror... ho... | 1 
                 webkit-1.11.5 | 1 
                libnspr-4.10.7 | 1 
             lttng-tools-2.4.1 | 1 
                       unknown | 1 
                     tcl-8.6.2 | 1 
           libmemcached-1.0.18 | 1 
                   mpd-0.18.14 | 1 
checking whether -lc should... | 1 
                  nftables-0.3 | 1 
                host-gdb-7.7.1 | 1 
                libcurl-7.38.0 | 1 

Detail of failures
===================

         arm |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/922e1fdfc13f2486a0aa9e07ef1d9194bf0b6edd/
         arm |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/ddfd94625cde9121b08ea1a30df866ed85defd38/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/3f2372c6c9c921c529739ad99d4e64d1067fbaf8/
         arm | checking for strerror... ho... | TIM | http://autobuild.buildroot.net/results/c65d90d2ae7ddafd4020f43d49ffbd8cf497475b/
        mips | checking whether -lc should... | TIM | http://autobuild.buildroot.net/results/e77489a54396840151e3b74c6fe0f7e88b2827da/
         arm |                   ffmpeg-2.4.1 | NOK | http://autobuild.buildroot.net/results/ec71e4f16ee9106747dff5f15999cbd17903e76f/
         arm |                   ffmpeg-2.4.1 | NOK | http://autobuild.buildroot.net/results/5bbc8b5cdcd99229a6813970293f98b044fc489d/
         arm |                   ffmpeg-2.4.1 | NOK | http://autobuild.buildroot.net/results/d7ea8db79210228103257b6a28fada38cca142cb/
         arm |                   ffmpeg-2.4.1 | NOK | http://autobuild.buildroot.net/results/be72eb182eaccf0064a32c9dfc2ac1c0d6555506/
         arm |                   ffmpeg-2.4.1 | NOK | http://autobuild.buildroot.net/results/b35b71e3d21394e7ca24f3b112d8a4047cd6c87b/
microblazeel | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/32f0357c71d3164cdde9c7610f371571c054244e/
      mipsel | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/a66e1ab18cd12904a64afcbf54116ceef889e966/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/bef61579ba96a6a1b83c8ca259c39cef617aa77d/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/055e70d6cade813019ab3f5606daa9fe4726b7e7/
        bfin |                  gnuplot-4.6.2 | NOK | http://autobuild.buildroot.net/results/65ec96dab6762d1ffc005de2b4f7f6b3b37245b3/
         arm |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/82c8e8254e994a932d792da7751b740d1414f61b/
        sh4a |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/4ac4054f66422e13e7879162a2fedeb65966e9b8/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/c865214e74dd3766b6343ef73c666fa89c0b5dec/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/1d5ed0706d5bd814f0232740680659506899b86d/
      mipsel |                 libnspr-4.10.7 | NOK | http://autobuild.buildroot.net/results/368cfed40cfc955afc74e652ebda5e6db2457e2b/
        bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/5a334e0fc7f713ab45bd1064965592ee9de78548/
         arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/5ac86430952fb4c90256e331491e064925fc6026/
     powerpc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/f0c3be6a1edc38e15a23e8b11c1e7260f5bb6d34/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/bb170bd029da05b9b681fa81cf16e3ca398361b5/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/e8ccd09239f7d5416375238c87caa58a79d21ddc/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/15794a14b02b82900fe231992c2b0863947f83d4/
         arm |                    mpd-0.18.14 | NOK | http://autobuild.buildroot.net/results/100f895aadd1052e25c2d962eada35914fa265ab/
        bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/b073e517636d3eb2b4bd159eccd0b72087d22655/
        i686 |                     ola-0.8.33 | NOK | http://autobuild.buildroot.net/results/838e621c824e1a47959c3dd656a410aa76258b78/
         arm |                     ola-0.8.33 | NOK | http://autobuild.buildroot.net/results/e52f1dc43f66c8a9b21aefb22af70f178f4d1b4e/
         arm |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/14f5d8d044c1d54b31009f63946835923976005f/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/2abb7ad52886e82fb68a04ddcc1ccded5d7e77d7/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/f114797ab8a7cbe7633454e144d0eeeb11a02662/
      xtensa |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/5a6a3ee9ef65cbf78c990d5c49b414e20f291747/
         arm | tvheadend-ca742e00a77177873... | NOK | http://autobuild.buildroot.net/results/910fb83484f49923af6efec43955695e300bcb61/
     powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/f90a9ca2431249faeeb048e5cafb728ecac6f6a2/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/91e89f54a5e8298e9137d53be12b95a3d7e2ef8f/


-- 
http://autobuild.buildroot.net
