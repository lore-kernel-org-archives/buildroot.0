From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 Dec 2014 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-07
Message-ID: <20141208073014.D131F1010F0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-07
===============================

        success : 174
       failures : 71 
       timeouts : 4  
          TOTAL : 249

Classification of failures by reason
====================================

               host-zlib-1.2.8 | 12
                    zlib-1.2.8 | 8 
  toolchain-external-undefined | 7 
              fconfig-20080329 | 6 
                  guile-2.0.11 | 5 
ltrace-0896ce554f80afdcba81... | 3 
             python-webpy-0.37 | 3 
                    liblo-0.26 | 3 
                  thrift-0.9.1 | 2 
              wireshark-1.12.2 | 2 
                   nginx-1.6.2 | 1 
                 libsoxr-0.1.1 | 1 
            modplugtools-0.5.3 | 1 
                    ruby-2.1.5 | 1 
                 mpg123-1.21.0 | 1 
freerdp-440916eae2e07463912... | 1 
            lttng-libust-2.5.1 | 1 
                 openocd-0.5.0 | 1 
               libcap-ng-0.7.4 | 1 
                 gnuplot-4.6.6 | 1 
                 webkit-1.11.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               libsigsegv-2.10 | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
checking size of uintmax_t.... | 1 
             alsa-utils-1.0.28 | 1 
                xapp_xfs-1.1.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                     vlc-2.1.5 | 1 
                 gnupg2-2.0.26 | 1 
                  sispmctl-3.1 | 1 
           libmemcached-1.0.18 | 1 
                libexif-0.6.21 | 1 
                    exiv2-0.24 | 1 

Detail of failures
===================

     powerpc |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/d72f31bab907c7485d03db4597d01fd759277db4/
         arm | checking size of uintmax_t.... | TIM | http://autobuild.buildroot.net/results/9dd773b488263094657a69deaad85d4fb34a88ec/
        bfin |                     exiv2-0.24 | NOK | http://autobuild.buildroot.net/results/2b28a6e57aabed8ae10da3c029152f2c352b6757/
     powerpc |               fconfig-20080329 | NOK | http://autobuild.buildroot.net/results/487c907900c3292653b6b7dc7c2b0f3841d4449a/
         arm |               fconfig-20080329 | NOK | http://autobuild.buildroot.net/results/f61b264ebf2c4aac8cb4b03c0722cbd92c6b117d/
        i686 |               fconfig-20080329 | NOK | http://autobuild.buildroot.net/results/13d100a13b396e3ce5fbc94d6e4d4874c3c6aeed/
         arm |               fconfig-20080329 | NOK | http://autobuild.buildroot.net/results/30b8fefb6cf2f7ae225537ae8ac7836eeee9a4f3/
         arc |               fconfig-20080329 | NOK | http://autobuild.buildroot.net/results/cb2e905e604eb1942c22a6446858ba868ee2a387/
        bfin |               fconfig-20080329 | NOK | http://autobuild.buildroot.net/results/4bda5ec46e1535defe80b37bb2e69974e2cc8d3c/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/b6052280f92a319bbd585ec87d844aa9c8954ff4/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/ad723c299c149ed524ceb6527209089cd1f9f982/
    mips64el |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/5f11d04086a5e28ac21d43c973a184a3f88ab60a/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/53daa9434f78a85e7f693a8f0aa68607b89bb59e/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/64198ebfecca5c76c8452ac0b7128d2ab00e71a3/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/565e5b613e125d4557bfcefd41d28644f3d6ab35/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/bf716169aef4a6449991a62ada8de8e8fb107aba/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/755efb6bb7f526aeac618a99fed9bb761c51b527/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1a12621d1942cf0e57515dfc6b79c5278bc6c60b/
microblazeel |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/5e49a885067308809b8bd443fd31f6308731d465/
        i486 |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/b54ef69553d0040f84ead336d31d864fd4cc6f67/
         arm |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/cb2828647296105e75e9055e072a12a0692875c3/
microblazeel |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/c27e8407ffe72b73f44d77c20874510a3970da5e/
      x86_64 |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/8ddb3b61f9b814d19b2b3072aa32578c4544109a/
         arm |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/19f369af54137cc4dc3fc05d219cdf746984ee88/
        mips |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/a944244c25406ab5e3f5d5c881178e7b25e1183a/
      x86_64 |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/e00bd85a681e0c9ee657a02665fb9a9a59fce424/
        i686 |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/bad8eb94ad1dd2fce21708f527f8430e15165b81/
      x86_64 |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/3bf33047224b2cf52698d0db48a3823a058076e7/
microblazeel |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/1a9643f8633db038d4fe5ca4a32e4d52e70a3a1a/
         arm |                host-zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/3675fb5d3aaff8b1e7144bddd024704f522865e6/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1ca8482dc78138330742071374976f21060f95d7/
     powerpc |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/d572a64b5988ee64d240ea4f7228c528cc33fef7/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/a8519c798f31d8f7b4152168c9fd56e9f2aa3c2c/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/ab01cba1825e47777fc3f39db399a558395ba8e9/
      mipsel |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/b6167aee249fe8d8fbed1c784fe0fb0aaf63b0bf/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/58698e59331f46dd5be5c29d9901c53b73218eaf/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a567e0c9cf8479beda04e553aff11e2c34bc7b3b/
         arc |                  libsoxr-0.1.1 | NOK | http://autobuild.buildroot.net/results/91325bb8ee5697ac8d687ec85c1b6b1f655e4f2d/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/5f25e7d0ad8b2096f3b6be58e3618752bd34a62d/
     powerpc | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/0ee7e5cd0724191ffa9e8958e4c8a0ccb4be7843/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/6dbc1ae00d76ad26418af81b5c746fa19d4d104b/
        i686 |             lttng-libust-2.5.1 | NOK | http://autobuild.buildroot.net/results/3d996dfb3f67a6c30718cb99cc904011294dfcff/
      x86_64 |             modplugtools-0.5.3 | NOK | http://autobuild.buildroot.net/results/2bb5a85d4f7f7a10ed63d0f27af92fecb816bc14/
     powerpc |                  mpg123-1.21.0 | NOK | http://autobuild.buildroot.net/results/b8be1a50d913c8696a3f63d79204cb1f2e8e9a08/
         arc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/771b96f222ba0aa36253741991d1250dfdac87e6/
        bfin |                  openocd-0.5.0 | NOK | http://autobuild.buildroot.net/results/d42f7d9331be116d1356489410f66cd2b6a58d43/
     powerpc |              python-webpy-0.37 | NOK | http://autobuild.buildroot.net/results/132217cf1e5d7288002f73d1b7b55b21e17a499c/
     powerpc |              python-webpy-0.37 | NOK | http://autobuild.buildroot.net/results/e6bdb8e0ab6daa027a01507861ecde47338a11a8/
        i686 |              python-webpy-0.37 | NOK | http://autobuild.buildroot.net/results/65b08e1fa362258d93259147348cd847d13e61ed/
      mipsel |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/74b0a3f30590e3a12541d4ea405032b552ce4431/
      mipsel |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/bb163921413ab85500f421f80a85ba8cef7f2990/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/42f224e58cfd0dd55c875aa58e0e46a9493d6a79/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/eeacc29dac058139c532bc26eb869bdd13a960e0/
    mips64el | ti-utils-06dbdb2727354b5f3a... | TIM | http://autobuild.buildroot.net/results/21418a9884394c1f8f57fd16cdaf462554137afc/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/82d17caa242ac6a5a116aa4963bb857f0307d005/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ae2c587f7037ffae3ef950f67aa63c6572842143/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0aa1e39270f46393ddad2c926758b2303d4cfcbc/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/3f87ffd93f02764a5fd4a2aa39a886c42b87be2b/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d923cbef155c852f11fcc4f2d5bde855c6963063/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7be8ac68ee63e4afc75965a7d06e56d94db4d23f/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/111b6c8de0b6f1223b43e204449cb1f72cf0e01f/
         arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/4a95efc50402010368420775cdfd843b9ad941ec/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/11af1dd21e42d147fc8997deafd190081b265e82/
      x86_64 |               wireshark-1.12.2 | TIM | http://autobuild.buildroot.net/results/8d2dc394d0fc0d935d160ad825309f08349b6fdf/
         arm |               wireshark-1.12.2 | NOK | http://autobuild.buildroot.net/results/d1c72130d7b6024996317c265caa06e80bfa8df8/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/260f40e09f07b7b7bbb95a9d6d08b36e20bcbcec/
    mips64el |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/2dff230546fe74cbc05e8750758ddbdcecb76ce0/
         arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/ce5331ffbda4bd217aebad277a2f2f3f1ab2dc91/
        bfin |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/797b517096d59a0bfbede5fd3e281d9a82190622/
     powerpc |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/55750fd22966455098abaeab948db01f2bef81f8/
       nios2 |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/8730b4110bd2ad1efd6f1632f14069f02a47f4e7/
         sh4 |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/8c33837d2b3b469c4795727f7ca0891c2fd356b9/
         sh4 |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/8055a3c56a67d576dca87e235b9e9e4f5d267e18/
    mips64el |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/61c840de60f7675f0989d7602fdb64f478d6064a/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/f618cac4f238903f41e484711e6c43a9b1ab3bf9/


-- 
http://autobuild.buildroot.net
