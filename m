From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Dec 2014 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-23
Message-ID: <20141224073017.97018101278@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-23
===============================

        success : 285
       failures : 75 
       timeouts : 6  
          TOTAL : 366

Classification of failures by reason
====================================

                  guile-2.0.11 | 11
             libxmlrpc-1.25.26 | 10
f2fs-tools-baac4b4e6f41ceb0... | 8 
                liblinear-1.96 | 6 
                  libdnet-1.11 | 5 
  toolchain-external-undefined | 3 
                    vtun-3.0.3 | 3 
                poppler-0.24.4 | 2 
                  zeromq-4.0.5 | 2 
                   erlang-17.4 | 2 
freerdp-440916eae2e07463912... | 2 
                    libcgi-1.0 | 2 
                  thrift-0.9.2 | 2 
            host-heimdal-1.5.3 | 2 
             smartmontools-6.3 | 2 
                  sispmctl-3.1 | 2 
checking whether build envi... | 1 
       opentyrian-2.1.20130907 | 1 
                 libssh2-1.4.3 | 1 
                   libiio-v0.3 | 1 
                   lpeg-0.12-1 | 1 
       directfb-examples-1.6.0 | 1 
               ipmitool-1.8.14 | 1 
            ecryptfs-utils-104 | 1 
           python-pyzmq-14.3.1 | 1 
               libsigsegv-2.10 | 1 
                elfutils-0.160 | 1 
               tinyxml-2.6.2_2 | 1 
                    ruby-2.1.5 | 1 
qhull-60d55819729d7b49391dd... | 1 
                gptfdisk-0.8.6 | 1 
                oprofile-1.0.0 | 1 
                libupnpp-0.8.6 | 1 

Detail of failures
===================

         sh4 | checking whether build envi... | TIM | http://autobuild.buildroot.net/results/41d186e20055d54d6b52d70cf34939779509d1ca/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/65ea601b6cbab7a1aec76bdeec620ee5ba468458/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/2545188de561a444e8b780868bc6d83bd8128008/
         arm |                 elfutils-0.160 | NOK | http://autobuild.buildroot.net/results/9a7b154c8b0625433f31c8b20af7ed4a83c1b3cf/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/7964b0e9e9747a4ef2be463d6ff5b6819862af46/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/79f590973260f5148bcb0b4c9c9ebaf4ce8b0dd5/
      x86_64 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/28d4916da3c2b67da03975a36a7cebd10459b710/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/4b4450293bbd28301ab9e2e183912586f408750f/
     powerpc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/8f97186489134619de7086028a59523d528b0d51/
      xtensa | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/14a7e22f23595958dd1217348e069c9d23c6daad/
      mipsel | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/6bb9cf90f3f639b9c1290b5746b099cde6d965e7/
     powerpc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/29245d5f4c234db121849a7327adfc7a8ae35075/
     powerpc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/6458f7017625e194b09607e5a90e7ecceb8ecdee/
      mipsel | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/77d93850d96fe2f077b24e5c6cb1738824370853/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/4bd8140f3a84d158d722021592bd5ef849e1c848/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/2349d40ef8d658ab1cd7332eb1b42a75afcd423f/
         arm |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/11fba09345f802063a80d624e85f8c69f0f5253f/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/27b58579635bf7b961f7863aec53f67ac171f2e3/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/37a9beb7245acb74970a137481580f18ce4f0171/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/34dd2ed61725d767ac3907cf761d4594454fcbcc/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/cdb248294713c7fdb72e4e15ec3301ed00953638/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a2275222c5ca758284ddbb29d0ef2f620534a67f/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/137fd96fff412e5ef864e8dff3db80e89dc67d2b/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/91adbe256249f541f152cc485b91ac9eeef8aff5/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/36fec62923a391943690ee24e648b5ab05d9c865/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1e2a58824af3661c772d5829d35fb459502c0897/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7410e82b3aa02f2a5ce568fdacf5c49c17a99882/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/be2dced75d2dde9e2b1fc1c4cfdf8960b9d5cb65/
        i686 |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/cbcd7207144d5335c67015ab44312f5d16280505/
    mips64el |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/e44172f1c17ead7097c963f2d112ce0d31a5b172/
    mips64el |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/5ea6392745be6a9947560b1949520c21d1df8a65/
        i486 |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/42bd639e5a12d0148a2bc515257adcc338d2c095/
     powerpc |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/1cec4a457fd2234306d5d819adf00a6b9a22e59b/
         arm |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/5c806e004d209537252273741a36caebb433778a/
    mips64el |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/691f255fb24772a046163f3ee0ac1b161e1517b7/
    mips64el |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/98025129a78df55d74bfe7fc37eeeeb04fb0e70b/
        i686 |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/353a37ca80cc7ae748a1b266c55a2b16e2bbf89a/
         arm |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/0c3a8d229066e588df1bf032bf6b5199ce2b92b6/
        bfin |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/e01d3eb23bab4103c8bc3ccadf4006d6a96441cc/
         arc |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/caebcd6c451f6ae945e59a533822c51e3a4e1c4f/
        mips |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/eff59c86954016ea64f10c9c68a363e7af2bd9df/
      mipsel |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/64ef7c1f61ba627b1f6e6e55532df4ed3c5197f0/
      x86_64 |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/8ff542dd1d7dbb2cbd4463575ed696ce7f7e9b5e/
      x86_64 |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/a1b2143b60904e4b83b1e3d9c2d6b87b2c9239f1/
        mips |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/15fb7708ddad3e60a0c42a995089ef01c43d1587/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/7d3c56cdbe435dd9ee573cf70ba522803ab287f0/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/5ff085495e11723b4372d892e7369ac7825347ea/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/40026c0748b825917ac6ffcbe05613a7a54913a9/
        mips |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/26cf505c7b09f1d16e8622bf982c5975ef910b76/
         arc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/6af7a2e2a9c4f5b41e14d12befd8c1a893c0e5b1/
        i686 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/da7aaf9842c93aca4be064bd098861931e515a9b/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/4af9f2c76b5b90f8d693084d86465f3c39b28e93/
    mips64el |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/8a9e0f885726e1d1707e7272a1b2453e653a675c/
         sh4 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/f7ca6ec7ab4a0a7475134a0240dceee1a3e7b365/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/be731f37bef69f27e4e5e7f5a3cf3dcde1072017/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/46475eaf9039806673bf937fc5f8f6258a197d70/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/c5bebb1862654ecc6fddb954cc4da169a0d772a5/
microblazeel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/28636811035240ef4ee0013c2c196deb2bada105/
    mips64el |                    lpeg-0.12-1 | TIM | http://autobuild.buildroot.net/results/ff4326ea72bd42627f0ba7d06a6a9c3e812806d2/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/bf21e175025f7ba750d35b93879a1ee5408ff8a4/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/7fb40932d4add6a9768dd869f03cb5c6e62ff660/
        i686 |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/687fe443025e6b3f31ec38bee3843f96c6714d0f/
     powerpc |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/50bdc17a345276c814a2dbd3ba6dc32020e12ca4/
         sh4 |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/c2403131acb08c34f1833178222d87ff02db6ac6/
         arc | qhull-60d55819729d7b49391dd... | TIM | http://autobuild.buildroot.net/results/2bce5ea995d55db0f2385f8486d7c8f7a3d99f5e/
     powerpc |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/92373be05058793f8116a26f14e2be8e34912ec2/
         arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/dcd043231a5e0cf8de808990725ff94c71b22a8a/
         arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/21fa2b9ae6320ffbd817bb26eb22ef7380dbdd78/
         arm |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/85f903d2c01e214178ab62c8b4221e26df8f49f9/
      x86_64 |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/17992b600312d9df8dcc339648a078a93ce21f89/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/aa38f14ad6120beeb064ab3167ba667f8f7a50f2/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/a256c0f49a18ab1809f9252a6fafa5d406b2fe54/
    mips64el |                tinyxml-2.6.2_2 | TIM | http://autobuild.buildroot.net/results/09581360f21a38c670ef20d68e81ef9e8fd4e2b6/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c440bc84542ed7697ab83e118616a654b4590e79/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/405c571a5ff4fa1b18b45f0a0697f3b2d877cec1/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/4a997c29e14f488f06374944ffc99d94704847b8/
     aarch64 |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/5594f5ee9737cb079708debe97a07fb4eec45e47/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/611fb32f1155231592304c040888aba291afeceb/
     aarch64 |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/4d94760fc5fe7bf707635e1ab8a30ddf521b3756/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/33570e67135e8597326a32e0ca3d4a0fdfa1e56b/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/a8fd78c0de8c17b289688254742f72676059470b/


-- 
http://autobuild.buildroot.net
