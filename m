From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 08:28:56 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-12
Message-ID: <20170213072856.17B5B207C0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-12
================================

      successes : 204
       failures : 52 
       timeouts : 2  
          TOTAL : 258

Classification of failures by reason
====================================

                     wget-1.19 | 10
               openswan-2.6.46 | 9 
                 sngrep-v1.4.2 | 6 
               cbootimage-v1.7 | 3 
                 qt5base-5.8.0 | 3 
                   ortp-0.27.0 | 2 
                 wavpack-5.1.0 | 2 
                  apitrace-7.0 | 1 
                    cups-2.2.2 | 1 
         docker-engine-v1.12.6 | 1 
               domoticz-3.5877 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  lcdapi-v0.10 | 1 
                  libcec-4.0.2 | 1 
                 libv4l-1.12.2 | 1 
            lttng-libust-2.9.0 | 1 
make[7]: *** [libavfilter/a... | 1 
                   ncftp-3.2.6 | 1 
                 openocd-0.9.0 | 1 
           oracle-mysql-5.1.73 | 1 
               pulseview-0.3.0 | 1 
        riemann-c-client-1.9.1 | 1 
                   slang-2.3.0 | 1 
                       unknown | 1 
                     vlc-2.2.4 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/01111914f38d762a576bd7e034490c4f25b70ea3
         arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/44ca075be6c38622e79e7a9085c9f927239341bc
         arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/01df03b9657d13aa654688147cf84238bf9cceea
         arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/68395c1e73b77a942f055d8e00a4c14641147324
        i586 |                     cups-2.2.2 | NOK | http://autobuild.buildroot.net/results/9d07b1951ac08caa0ff7a1cf1a2d1954627e8350
         arm |          docker-engine-v1.12.6 | NOK | http://autobuild.buildroot.net/results/5548bf321ce4f6c70be4b5d7d6e8ec615acd7194
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/454c0ea393615bae2d1b44be9920f25b5c49fc33
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/567cf933e57cc2008a5553187f84a21d15c2cb55
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/74ac38848481431933003a54004d68d227c5e160
        i586 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/f2c8b1c3b10e73771d9136906d7f4323890cdd5b
         arm |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/3b2509b4d5020d655d977b04edcf4e4903ce4aca
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/d3626a70a90e629cf9bc147c6d6822093720b627
microblazeel | make[7]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/702afaaecf7b714913304298b590442db17cee0d
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/e924cb34524d07f5715415bf3b6410fecf9b8bc6
 powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/7448e452bb004ebcaef7428f4e76fbf8c911053d
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/88fa9bcbaaf9e10b3f505515a00438a872f7c7dc
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/a1f6cd9e0091d6eb8e8313d197f5b8e8c60c351d
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/31cf680c48bec8ba4450a6fe2156cb441c4dd660
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/a87d9fa1a3c88f0b3bc786bef1f0ab204ba8a570
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/392e2eda396c58f16ba5bc94b539591ce6dacaae
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/1971144667e5b6bd6ccbd5dd3197bf13dca5e27a
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/e89d050c01a614ed3c0fcdad32016250e3efd6f3
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/95220f231810cb12ba97a6b44af79f84af706c82
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/560e3d663c5f600f1d21a301cbde950f3f4eb6e2
       nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/04687427e76eaf518e2434cf415f5b37f522c91f
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/1999c841fae41f860f00747a362327cb2857e687
        m68k |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/37d5625df4be11ccdc063871e9f6e13d5f59fb52
        i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/adea9462f5dc7567c668dcc6025fd6b882b7d3b7
       nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/a2afc0d52a299acf06646ef6ff4e5cb7fb7dc089
     powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/f750d72a0d3b6dd9a563f67f75fd04994548c031
         arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/7f722392419afa9d9e99ca371826ab9dc69333e1
        i686 |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/2f85a2d19232365f7e5fddde6092af9dd74d4518
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/a53f9a5462232101e27812ae8dc887a9ba202f38
 powerpc64le |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/b3db451e1ce96fd972dd97168c29b915133d3af2
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/0ae30d794aab1832844ca6f4983874de38f48905
       nios2 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/9033dba53850b64dfb3f5b8c0b0eacf4104a23c5
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/bc0423cd8b4696374aca339fe4652a7d8bcde496
        i686 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/a3566db312dc621d94068637db367ad617ef1ab6
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/13d9f3717f28a6938b8154646af6f565fa724ddd
      mipsel |                        unknown | TIM | http://autobuild.buildroot.net/results/6f9f8df2c86a4f8ee304db434d99e4b60e85176e
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/b829ef253b193b6b684e1a3ad7f5f388344dd23d
microblazeel |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/80c790c374aef9284403e5c0dc703a364e10c067
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/a9f4b48b87f7e1cc701599b322af0b854e5161e7
     powerpc |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/9bfa2dd87fbef7c5ffa0d99fdf9fde60691ec859
    mips64el |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/5dc908345be31e7714490989a53bcc10f0f7645c
         arm |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/f40735fa3d30555573429a78d983230c00ecf030
     aarch64 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/91fc7115532ac7dd46166cae90d2621105e9e422
     powerpc |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/479b4a20513c91d99310357698976e77e27f34c5
      x86_64 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/951980f46950db236165a90faf9ca255990b1845
     aarch64 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/2ec4a7e22d8b4ae0311dd3f41c0cc2fd9046e2b7
    mips64el |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/f543bf7d41b9d8a10590da7fd8401db86183f9e4
    mips64el |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/be229ab204631de3f608d6dc0ed0caba550e18f1
      mipsel |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/c6b022efb46d3a4d0c2eb91006f576b3b908f468
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/9b91d85d6628d3315e85cd3b9eff7a822cba13a6

-- 
http://autobuild.buildroot.net
