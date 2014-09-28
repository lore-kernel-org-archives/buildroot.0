From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Sep 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-27
Message-ID: <20140928063011.030551009E8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-27
===============================

        success : 165
       failures : 22 
       timeouts : 6  
          TOTAL : 193

Classification of failures by reason
====================================

               valgrind-3.10.0 | 5 
                libcurl-7.38.0 | 2 
                       unknown | 2 
zmqpp-36413487f05b165dfc82a... | 2 
make: *** wait: No child pr... | 1 
freerdp-440916eae2e07463912... | 1 
                    vde2-2.3.2 | 1 
                host-gdb-7.7.1 | 1 
                    php-5.5.17 | 1 
                    ruby-2.1.2 | 1 
             bluez5_utils-5.21 | 1 
    trace-cmd-trace-cmd-v2.3.2 | 1 
                    fltk-1.3.2 | 1 
                  zeromq-4.0.4 | 1 
libshairplay-139d5ef5556451... | 1 
            gst-ffmpeg-0.10.13 | 1 
                  prboom-2.5.0 | 1 
                  thrift-0.9.1 | 1 
checking for mode_t... ruby... | 1 
              uemacs-4.0.15-lt | 1 
              librtlsdr-v0.5.3 | 1 

Detail of failures
===================

         arm |              bluez5_utils-5.21 | NOK | http://autobuild.buildroot.net/results/033198c594679b4520d6720884458d4371aa641f/
         arm | checking for mode_t... ruby... | TIM | http://autobuild.buildroot.net/results/8f27c249841de6d89c365ec0e946cfb274df9ee3/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/8794199d07cb35e8131462e31a9c42d47b566673/
     powerpc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/ad7ade4c436d21cba930f40c613870fbadec840e/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/f96f14bddb07a3f28ec3e92c858db542d29a7ba6/
    mips64el |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/0f4bf2ffe764fc2605da469e2505680f6c2be519/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/f4deef4e7d2e2cf5fbc9ce5f02289b4dc60cd23b/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/dfd81f1f1f0f315317b2a85d24b286a277ac7c16/
        bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/3a7e841caa3aee483f4ef962d8cd74a31f2096f4/
        bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/aee74baab30c782a342f721ac8e1564e4e551188/
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/f6b893d9ff7a3ceb6a5fb80ca1a56cdca6a166a5/
         arm |                     php-5.5.17 | TIM | http://autobuild.buildroot.net/results/f1808282ba379860c0b0096388de414b1b5cfd7e/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/22759a4ffae6402f7f29f3dde912278510604f0b/
     powerpc |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/2625e507fddc11cc6d05a2898f64e9138639c8e1/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/e4597ddf3d010682769469388e1ecbfd22ddfabc/
         arm |     trace-cmd-trace-cmd-v2.3.2 | NOK | http://autobuild.buildroot.net/results/4d773e0738c1d5adada8c0a4bca312068132fd9b/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/f3b603912720cbcdae361090709aab80a2022c54/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/b1c3da121dad621b50ec573408ef5226b8833db8/
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/15f8e9d0471245cbf45e4f1a7263bc52e752ea59/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/717165e75750bd079c5e87cd33d13e01c7a3fbbb/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/4261d030fa52d1603d085990280c1d2ae4644f9c/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/6ad2ba539e479a9df355fc9d6a29e0fce481ea3a/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/34b21bc2f05e3c8e0f007605671570d4fbdde7c3/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/2846327f5a46083bfe81270ad9b4af92d03763d1/
      mipsel |                     vde2-2.3.2 | NOK | http://autobuild.buildroot.net/results/f9d23455a138e2214546922486c03c9d3c35b04a/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/c2fffb8e3db5ddab06a0613f304132bd79667d35/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/c0fa3da8afbc9b5d99ef043934c0eae9c57c327e/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/35913b9d9f7cc08aa7a405c56a95be58559867c7/


-- 
http://autobuild.buildroot.net
