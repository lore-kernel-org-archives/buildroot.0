From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:31:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-26
Message-ID: <20200227093138.523B887666@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-26
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 20  |  1  |  0  | 21  |
  2019.11.x  | 16  |  0  |  0  | 16  |
    master   | 126 | 48  |  0  | 174 |
     next    | 34  | 22  |  0  | 56  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 7 
                       unknown | 6 
               protobuf-3.11.0 | 4 
                     vlc-3.0.8 | 3 
              bitcoin-0.19.0.1 | 2 
           host-nodejs-12.16.0 | 2 
                   mimic-1.1.0 | 2 
               mongodb-r4.0.12 | 2 
                    qpdf-9.1.1 | 2 
                 rocksdb-6.6.4 | 2 
                      bash-5.0 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
               dvdauthor-0.7.2 | 1 
               fail2ban-0.11.1 | 1 
                 gerbera-1.3.4 | 1 
      gst1-plugins-base-1.16.2 | 1 
                host-go-1.13.8 | 1 
              host-grpc-1.25.0 | 1 
                libgdiplus-5.6 | 1 
             libopenssl-1.1.1d | 1 
                     lxc-3.2.1 | 1 
                 mesa3d-19.3.4 | 1 
minicom-52b626b15a883b03006... | 1 
                 opencv3-3.4.9 | 1 
                  pango-1.44.6 | 1 
                 qt5svg-5.12.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/c4bc6cc208e94ffb84caaea03c4898a3001c7f9a | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/f4821f44ceb2811e9ab160dd2cb886243215df52 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/f3ac50c32c7e4fd3a5e9e3dd4170b0799a26270b |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4569cbbe97ab9057e5e3909a03540544d588a479 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/71fdd490873809acd89d7b3e3ea27e88c5b62c24 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/caa1041217f8b2bc835dd6a06c13d59f70f72caa |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a05dee0491871bdd7d0a8f53d96e7971f7c71d1a |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a8edb5621ecc2d250f572240b0607762735b0ffb |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1c6d8e80974547c48f6a4c9d2ff43b9ba268a2aa |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7d8ccf9cc8559db9aed19bf32e6cb342141bd360 |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/7885705f1b1c0f31cf21b464150f5509929c1906 |     
    m68k     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/9c7f4f22386d4ffd211ed62da323f9861f1b1716 |     
    arm      |        fail2ban-0.11.1         | NOK | http://autobuild.buildroot.net/results/4b16c925a0aa0aba073324e2c3a4297c456b55bd |     
  riscv64    |         gerbera-1.3.4          | NOK | http://autobuild.buildroot.net/results/b499442a920dd3969e2beb2099504d33641b4980 |     
   xtensa    |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/42cbc33ded6cf04f5cb2edb105f2e561d06886ff |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/fa13a054995d6060d2dc15c36007e41a50ed7fc4 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4f853af32b5c09e63896e2125b5d018d279c0951 |     
  aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/a83acd958d177a47ea2b1ca94b8a163da3e4a2c5 |     
    arm      |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/c7934318c29b9dce9062d93158906409c5229a6d |     
    arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/46c5cf068cf9ea50e53491870d9dbf3f134c8c22 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/686b92af36ec691dd06078c18df21f59209bea06 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/94d021c513569cf4062619127ec2262d30b3201f |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/6387b0a99e1a0922811919623d9a10b0943988df |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ddb1c83ede34c125296563227f6b8f4b76729480 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1a0caff18be6d55395c40f4d9f04076b03122757 |     
    arm      | minicom-52b626b15a883b03006... | NOK | http://autobuild.buildroot.net/results/d3edbab1f2cd0f7b790e2559dc8d489497ae02f3 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/80a0d9dc59567c28b891c50c63280cea3aad613f |     
    arm      |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/5765e33f444a22701b055015ed41436d3526e9eb |     
 aarch64_be  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/3938ecd3a0aae2e87d3876e7bf0d8244dcffb457 |     
microblazeel |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/e5cfb968bc867d14f4ef4dd8da63b51360bc6808 | ORPH
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/25a594a74795bbccf5a218a6cd3b6804beac6e4d |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f0086358fd7bca5f2e77855c926641329e2e6ac8 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/079fd66a15dba75ed1ba70aec8708f35fb7e93fe |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f800a5f24cb4b23231165ad60c03bf177bad4a9f |     
  powerpc    |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/c57fccab2e644b4b97971e9961682fac96f00a5c |     
    m68k     |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/1e2299df96a2ddea22907870b6571553c5e7f7ef |     
    arm      |         qt5svg-5.12.7          | NOK | http://autobuild.buildroot.net/results/1c957888ba8f6124f093f96653035c8db2fc37ca |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/832e1c85ee5ff79c74e84536ce09a66befe14c39 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/cdf9f3435e9526eee12bbf036d333c82323d24ba |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b92c1c09de74886c9039b3b76f35275f4e7a7b6c |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/cdee1d3a823238be39f1d0bc6eb3498633b25865 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4e60fa31b1cd08bc7fdf9c5dd3a3f4941e029ba3 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8466f1798cad365040ba6a5359fac30aafc82a60 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/deb862bed384296c2a6f119f63d4174cacb823d9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4ce1704d3fc60fd3dec1d06b9031fb674b2236e3 |     
  riscv64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/e8fd34f3b9b7166772e04d3e15c478990d07d894 |     
  riscv32    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/a61819381ff8dc59b1cf20338df6b6a49f63e0c0 |     
    i586     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/f11e2f24b998ac68891ab58a2bcf7b8677801767 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 7 
                  gensio-1.5.2 | 2 
               libglib2-2.62.4 | 2 
                      bash-5.0 | 1 
                    brltty-6.0 | 1 
              host-grpc-1.25.0 | 1 
host-sdbusplus-4212292bcf13... | 1 
                   libiio-0.19 | 1 
             libopenssl-1.1.1d | 1 
                   mpd-0.21.20 | 1 
                 opencv3-3.4.9 | 1 
                    qpdf-9.1.1 | 1 
              qt5script-5.12.7 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/76c75d1ea30c44debd87228eee0102fc7fe3bf89 | ORPH
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d70f338a538dea322ce91cd3d57a6392c2ab55f4 |     
    arm      |          gensio-1.5.2          | NOK | http://autobuild.buildroot.net/results/62d1c2d6d55191d10af45d3cc95066308756644e |     
  riscv64    |          gensio-1.5.2          | NOK | http://autobuild.buildroot.net/results/14157f596e48fee26e81e5f6ce3c9f6e5f9eea1f |     
    m68k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/29e32d21d05f5acab5a460aa7c20339ab85f2a40 |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/1477fc1f40e6743bc2a2f39c7c88e8263a6324bf |     
    i586     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/1b10f65c636acf87e6bcf5341f6884b3cbb8bebb |     
  powerpc    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/32afc3051d02aae5473da56f916ceaa8d8e2e409 |     
    arm      |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/42ffbd07d0e998c75d1afde6a5db7d6418c10f45 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/14c0a553d4dcc82b08f4aef1fb95565879e4247f |     
microblazeel |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/838b1fba23d4a5ac7f4036ff5b124970df8bf8f9 | ORPH
    sh4      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/eaa94ebb57d69998b596fc75d4f62bde4fe015f3 | ORPH
    arc      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/d24a504c570655a0ff4b7077f3864a27b7b92e38 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/6265a0b889beb67b3c8aaa7ee789ab5127413b62 | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/38598433f53c79a64a9010cee05428af2b575ae9 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/ebbd7951d8e7cb51c5e25686d092f4d71dd2e717 | ORPH
microblazeel |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/5f5473d911886c31586e18ba3646d62cbd2f0d78 | ORPH
    arm      |          mpd-0.21.20           | NOK | http://autobuild.buildroot.net/results/b97b261bc974f2d2b5480645cef9bf6a37eaceb0 |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/e8124d2f7d4c0122d632b6d78820f478d7151213 |     
  powerpc    |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/6ae73d8965ec702207fa3edf5c82698b0fb936cd |     
   x86_64    |        qt5script-5.12.7        | NOK | http://autobuild.buildroot.net/results/2e08b8b1605e601eb57a3597b15169fb4b64cb3b |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/a5bd651e5c2bea2c571ed2412644028ba3d4c28b |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/2530b053e0b78c2dcdac2ab87b6939ba99a10196 |     



-- 
http://autobuild.buildroot.net
