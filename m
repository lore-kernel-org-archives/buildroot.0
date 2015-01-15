From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-14
Message-ID: <20150115073015.A8D5B100ED3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-14
===============================

        success : 303
       failures : 37 
       timeouts : 1  
          TOTAL : 341

Classification of failures by reason
====================================

              host-erlang-17.4 | 8 
             libselinux-2.1.13 | 5 
kexec-lite-fb8543fea3beb052... | 3 
                    qemu-2.1.2 | 2 
               lightning-2.0.5 | 2 
               host-qemu-2.1.2 | 2 
               iptables-1.4.21 | 2 
                jasper-1.900.1 | 1 
              strongswan-5.2.2 | 1 
                    fltk-1.3.2 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                     rpm-5.2.0 | 1 
     start-stop-daemon-1.16.15 | 1 
                 xorriso-1.3.8 | 1 
       directfb-examples-1.6.0 | 1 
              libarchive-3.1.2 | 1 
            host-heimdal-1.5.3 | 1 
                      make-4.1 | 1 
                  zeromq-4.0.5 | 1 
                  python-2.7.9 | 1 
               qt5webkit-5.3.2 | 1 

Detail of failures
===================

        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/cc79cd46cf426b77098b55e9bed723f4137cec16/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/14f3e7d188d80ffaa910ef1d127654b5d4dd7d1c/
     powerpc |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/12d20d80f097112e77a2f7cc45ab5de859a37dc5/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/a15d5955904f42beb7c41b90cc6a7ab9bfc44b68/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/fc44f32944ec415a633f76d76ea3254f874aec5f/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/c1668bf9e21b85d121c24f7979953a85f2f3e367/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/c2f8289721ddf32321ca6b1ab28137f0746dc978/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e9ecf7559f7c2d8b880e4a11acf181d2757a3184/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e542196417e08bf04e7c0a7955842debd4748a23/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/0c151ca521a2aa0934bb34d9ac28d5251c52ebd0/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/87a18adab153b64f0fc5c3ef9f414ec31733ebc3/
    mips64el |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/d284248b8d2ca2982aa4b5084245016f5b4354b2/
      mipsel |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/5ce0f0c6955969f823448fca52412b3c1950b111/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/98084aaf392c62ba095b208f2065a722fa1010b9/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/81e7674f99192e5b3bddadb92174e1803a8feb84/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/38d66308d1baf1799863a71e94ddec09504ade3b/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/ea87d946a3b62d0d41f1aec01bc2f67009080bdc/
     powerpc | kexec-lite-fb8543fea3beb052... | NOK | http://autobuild.buildroot.net/results/d66fde2763351f298bc459d594f3ff243ba926c4/
     powerpc | kexec-lite-fb8543fea3beb052... | NOK | http://autobuild.buildroot.net/results/df8e01f9c5ceb7faee537985fefed169f95d6ceb/
     powerpc | kexec-lite-fb8543fea3beb052... | NOK | http://autobuild.buildroot.net/results/adc486c525e3aafaa5e6d11a43d964bcd9f2a774/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/eea2d593bc526655fd483f979a0bd4d099c1fe2f/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/28022e83816454827e738dd76ed7bab540bcf941/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a4127f250b5aee81c196bf5d70febd1bfd696dda/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/f42902b973a5bdbbd2cf978f408d4102bd139040/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/1aaa48a4b93e8f5693fc71949c7fd6a2be6afdc6/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/55d897773569b3c6a569ade5678d4862868739a1/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/1c510d3dda02aac584782f96ac79cf5a0c5dac7e/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/0637d15a83fb6c25613d79e2593928f91c148283/
      x86_64 |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/4f5dfb994134377d5936d3062c2146bf7a6d8d15/
      mipsel |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/74deae1f7c81e319d1e7d00177f7c8e2c97b8ce8/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/5d879c98c176886b1d7ddf28e66641483589311a/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/3587dadd2f1008e79201aba0c5040ac0691be848/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/cb2fde6b47b41ad453916a87141059e3e347fb97/
    mips64el |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/88f07675b9daa104968e752afa45e0b8b06ab1dd/
      xtensa |      start-stop-daemon-1.16.15 | NOK | http://autobuild.buildroot.net/results/445bf4742d78a0bf93b4c75dc733c4315530031e/
microblazeel |               strongswan-5.2.2 | NOK | http://autobuild.buildroot.net/results/3ba43bd50e6f987a3a070d49261d444c140845f4/
         arm |                  xorriso-1.3.8 | NOK | http://autobuild.buildroot.net/results/941bb7d5c8ffa14fad54343d515b56e8ae1a98d9/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/8a6c4d376bf9c89a83a74b2481129cc66aa982be/


-- 
http://autobuild.buildroot.net
