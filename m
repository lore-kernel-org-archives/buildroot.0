From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  6 Jul 2018 08:00:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-05
Message-ID: <20180706060028.D212F208E3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   0 |   0 |  13 |
   2018.05.x |  18 |   0 |   0 |  18 |
      master | 145 |  31 |   0 | 176 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 7 
                   wampcc-v1.6 | 7 
                    host-rustc | 4 
               mono-5.12.0.226 | 3 
                 wiringpi-2.46 | 2 
               asterisk-14.7.6 | 1 
                libmpeg2-0.5.1 | 1 
                   libnss-3.38 | 1 
linuxptp-303b08cbf55096aba5... | 1 
              mjpegtools-2.1.0 | 1 
                 opencv3-3.3.0 | 1 
                  samba4-4.8.3 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

      mipsel |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/391afd99de6c82398655446c4555e8bc333aff0b |     
        i686 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f905f514014ff82e5fced68976ce213906ce82ce |     
microblazeel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/87b0c3720dae5c2bbd9a342c4bc701695d21188b |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/c7eb2444fc5877178572eec50243e1e278a861b2 |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a230e0f7949b462c61bb97b34129eaf5805c9c3e |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/9bbfc15c0cf76f03242e125cccac71434c52597b |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f3c32986d3c4da80dd089adc0948de041216ecfd |     
        i686 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d9d14a231a6743cd42742d0d8d38be60c7d62d10 |     
   powerpc64 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/f5433d06894f7f6a52e200987570237b706f1e62 |     
         arm |                     host-rustc | NOK | http://autobuild.buildroot.net/results/e70d9d81da85e497c5d93a24164f4108ed777473 |     
      mipsel |                     host-rustc | NOK | http://autobuild.buildroot.net/results/e87d2834b50baa9c43b35b452f5ab72d3c5e6260 |     
      xtensa |                     host-rustc | NOK | http://autobuild.buildroot.net/results/26578f4aa6b209bc8fc9ef9b562c6a9befeddd96 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1649cc1135b2c1de2a059aadf2be06a59166cae9 | ORPH
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/5434e4e462466cfdac56f1a27fb3c6bcfbcc0761 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/2e7f24528676bd385d9e6f0c58f58b03d8126be7 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/e70f1742ec39a2891cd65d162df62cf07b054e85 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/b3d2405f5512eb60756b4ce5b4e6d7b54f21caad |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/794b88d9f9b15c3ae1b2ffdba135287a353536c7 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/52da94f16e6919caa1cd0ea00c393c5f4d241fae |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/708394ae1704e04631cd92a8a0ce0fce0ef8e819 |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/50b96ff741657f63195dd461a4013bd86bb456f5 |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/7533571d2b795a362edf9c6fc453674859412b2b |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/63d9e923e11e86e125b32dec4f23ee2a6dd742ba |     
         sh4 |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/13afd0fb9a46dfea23e7ff5b05502f7f810d9a3d |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/c566425acba7e12e223518a5f8f92f887f592602 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/15a94d6260991797439586450918b3cca09058d7 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/28a1c5c1a852173295893eadf4c2d7457b34b220 |     
      mipsel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/b560bb1a5d7f2ea7588f5ec65438897d267aa117 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/1b70e648b331be4982f3c83d5a6f889d2e7d8793 |     
     powerpc |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/69d254b91cffdc0e4e52ab3ed0f903ee0b936b20 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/5e39ec8415fdcc0754d60af5e1d3bcbb84972a7b |     


-- 
http://autobuild.buildroot.net
