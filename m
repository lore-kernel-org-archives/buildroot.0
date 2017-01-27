From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 08:30:03 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-26
Message-ID: <20170127073003.CA12320D83@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-26
================================

      successes : 138
       failures : 63 
       timeouts : 0  
          TOTAL : 201

Classification of failures by reason
====================================

                  samba4-4.5.4 | 10
               sdl2_ttf-2.0.14 | 7 
                 sngrep-v1.4.2 | 7 
                    ruby-2.4.0 | 4 
                  fbterm-1.7.0 | 3 
                 libnss-3.27.2 | 3 
               openswan-2.6.46 | 3 
                   ortp-0.27.0 | 3 
               bctoolbox-0.4.0 | 2 
          janus-gateway-v0.2.1 | 2 
                    mpv-0.23.0 | 2 
            netsniff-ng-v0.6.2 | 2 
             berkeleydb-5.3.28 | 1 
                  cppcms-1.0.5 | 1 
            host-heimdal-7.1.0 | 1 
host-python-vcversioner-2.1... | 1 
libasplib-be7fac89218a84b75... | 1 
                  libsvg-0.1.4 | 1 
                log4cxx-0.10.0 | 1 
            lttng-libust-2.9.0 | 1 
                    mpd-0.20.2 | 1 
                    qemu-2.7.0 | 1 
        riemann-c-client-1.9.1 | 1 
               tcpreplay-4.1.2 | 1 
               upmpdcli-1.2.10 | 1 
                 wavpack-5.1.0 | 1 
                      x265-2.2 | 1 


Detail of failures
===================

        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/8e944806a57c75e40d71e180eda1cd0eaf2149f9
        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/1b37639863f40350a2d76faa487edad223fc6cc9
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9c7f3f6960f9cfc87d366f9c57cbb161e8ee2399
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/0407e363d4dceb25d245b58965a166b14337defb
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/e6914bfa6f5c6b5a06e6bb8ac740695c07dc9778
     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/5e8b46b42c62d2081511436e22bec61f0eda6958
     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/930b8acf84b8a6ee35489cc58c1d660e5cd1d13d
        m68k |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/b368ce1c5453fcabb01cea3479cecf003c56c181
 powerpc64le | host-python-vcversioner-2.1... | NOK | http://autobuild.buildroot.net/results/88c7d39e5921581f20f0fd06764e3c2e0bf1b819
        i686 |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/bfca5dc4ef4bf2b0c668c27f1e570d7aa42bdc6e
        i686 |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/87f337eba050e437dedbb3af9b9a812624b23881
         arm | libasplib-be7fac89218a84b75... | NOK | http://autobuild.buildroot.net/results/cc0b928ee24a526b7c82fd3f391e2be024a14578
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/bb15b9b0085c44200df48fa30961c7d72839165b
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/2d190714b856c2d8d9aa71bdf292370f03c2248c
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/5a6092615e9f3579e553c8d5cc8162f8f3d3a3b4
   powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/52e6be49b683638686ee21f21473488698bc2ea3
       nios2 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/98a78b47f65a468c336574c1dfacb06582d1902c
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/dba4cc71d10b98d26b607d1223f57b9762301e81
         arm |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/1d57c19573adf42dacd90630412f2d3dafab2bf7
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/51c0b41e32b6c7e959c4e74453d2623082e53d89
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/59a640e33946ffb54a398cfd6205c1df1d0f2aec
        i586 |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/ebe6c9547df6a9a62644ff3e9d496c5af05296c6
      x86_64 |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/43d3f2d54deb9d095a4f8cbf70a7b933c09ed618
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/21e1614bd99f6c418911bcc5151982c5884379e5
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/f37f96c5680e73ec71d67d5546e26b86f506404a
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/8fa5ba7f76b12c6f435a7e8cd1ae91800291cb0d
      x86_64 |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/d7018a953c9c7fe9d3dd6a36e990ca90799cb6dc
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/38dca2d384a5eb748bec907d7ebf99a5c0f30eb0
        m68k |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/e9e33cd5077eea1dfd9dcc19d6efe173757f5a89
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/da00559ae152a9859f7fb1c2d72a12fbd48dd650
       nios2 |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/064206dddd19f83e12d6782e68e94a7f20b5ad30
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/23ca628ff0ca94e16248ea4067ed7f3cb9cc3052
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/c9e467860fc72a417b62fb61b006cc5d5fd03a5a
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/82a90a6d42e6ffcb609801aab18dbea6065a31bf
        i686 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/ac42187a2b6fdedd5408183442a1d1759bc745df
    mips64el |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/c08b732f1eae4b51168085d57eea60188cb41aa9
         arc |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/7332dc1443cba1722e883814e298dd2dac7f049f
      x86_64 |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/e1fda958a37656d3b791caa759353c832e087ab4
      xtensa |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/3f6f3d22b857092d3971e0594cbb0727d651d418
    mips64el |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/b49812c07c143d187088c13dadc1019d9242411c
    mips64el |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/580f3146226b1f0f4a79c03e18161c811eb1637a
    mips64el |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/c67f1601df0601c6817454e4a894698bc3926815
    mips64el |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/431a521e5a1fd024335dfe9a8ae013e0b7cc73de
         arm |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/bee2701349c1a47dfb75be550f07f23cbaba6464
      x86_64 |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/f2e9780002497c784a7609c9bebef4142fd0374b
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/cd832e0808a35bab657a56537ade4b24e31b7879
     aarch64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9bdc920f5c7d1361626555dbbda15b2bc43a0e46
      mipsel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a0bad7f8131559f4d83e1aa0a2d754727b698363
        mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/4fd095530324c711ddb8e24bf290877c669e0fb9
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/82409bd399860f6ee2594867fb732ad0097076d2
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/3f16bf52179a982441b46fc72e6a2617e607d9f3
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1f3ea15c7e676bf0b4c2d674c5dd2cb1d953508b
   powerpc64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/002659a9f3f0fc112710d12c435d043461c41e1e
        bfin |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/18977f018da8e45ef5367fc5794e1167459544dd
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/e0a366a1ed67aa2e8c2944c8d387f9fcb8262406
   powerpc64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/18fbb5748a6ad66ac6ec8141c3296d2b13fa40ac
microblazeel |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/11e8848a830d5e4e1ee74a8be098ab0b6655ed24
       nios2 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/fee6275e7891b803d04b7e95f3e9e78a0825d42a
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/8468df3462ac6d53faef228ca241bc500b2d7a52
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/bd3a1d043ff525d5f70150205c67db666b00c8dd
         arm |                upmpdcli-1.2.10 | NOK | http://autobuild.buildroot.net/results/f1d704ab82925bcddcc2330282301a1589553588
microblazeel |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/7f99c3b9ee6251d4dffa3ddff5644dd66c189fb2
         arm |                       x265-2.2 | NOK | http://autobuild.buildroot.net/results/54006dada03eb2dd869df45e491ece7a99ac517c

-- 
http://autobuild.buildroot.net
