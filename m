From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-15
Message-ID: <20161116073014.84BEB207C1@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-15
================================

      successes : 199
       failures : 41 
       timeouts : 2  
          TOTAL : 242

Classification of failures by reason
====================================

                    mpv-0.20.0 | 4 
kvm-unit-tests-5731572b2ac2... | 3 
                 libnss-3.27.1 | 3 
                    mpfr-3.1.5 | 2 
                 openssh-7.3p1 | 2 
                   taskd-1.1.0 | 2 
                 xenomai-2.6.4 | 2 
             berkeleydb-5.3.28 | 1 
                bind-9.11.0-P1 | 1 
                  boost-1.61.0 | 1 
                     exim-4.87 | 1 
                    fltk-1.3.3 | 1 
             freeswitch-1.6.12 | 1 
                  gauche-0.9.4 | 1 
                  guile-2.0.13 | 1 
             gupnp-dlna-0.10.5 | 1 
                 libpcap-1.8.1 | 1 
make[2]: *** [smartd.o] Ter... | 1 
make[4]: *** [.moc/moc_audi... | 1 
                 mesa3d-13.0.0 | 1 
                openjpeg-2.1.2 | 1 
               openldap-2.4.44 | 1 
python-libconfig-b271c3d9da... | 1 
             qt5location-5.6.2 | 1 
qt5webkit-b35917bcb44d7f200... | 1 
                     rpm-5.2.0 | 1 
                  samba4-4.4.7 | 1 
          sane-backends-1.0.25 | 1 
                  stunnel-5.36 | 1 
               tcpreplay-4.1.1 | 1 
                xfsprogs-4.7.0 | 1 
                  xl2tp-v1.3.6 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/46fe0f3ef5ce6aa41a64f1cfa1a8d561001f4e28
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/30c4406a217c611e4d8518fb57e59146289027bb
         sh4 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/46ddd89a0fa21194894f634db59419c41cf186f9
 powerpc64le |                      exim-4.87 | NOK | http://autobuild.buildroot.net/results/e61c4eaeb70f2007a4276ea9f4861cffb001ce99
 powerpc64le |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/759b48e6b56c725b626e014014db81ed41825edb
 powerpc64le |              freeswitch-1.6.12 | NOK | http://autobuild.buildroot.net/results/ae6d9e674fe879b394face6a759e3f20096d3e06
 powerpc64le |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/c44327573c7845e8fcaeacf670694d83c907018f
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/b1497f5c3991fc5afe591031692349b4e8d4a74b
 powerpc64le |              gupnp-dlna-0.10.5 | NOK | http://autobuild.buildroot.net/results/5c5747aff27f1bb7d6b8c2186d87c58ac1933395
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/03beb5b897e3068e4edde3553c8f781b586a1054
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/69767e42bbbcf496c10038b62a754fc9a82669c5
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/c429169be9599e72422a4f971ba2bf303b0418de
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/be0bb9219b4a07c1ab8b0a3bfde3f71499248ca4
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/c4bc3d94769497c4082c893a9191d9c2176a2a72
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/2c2ee8f94ffe209904410faeb9ca58dc87f6ec22
         arm |                  libpcap-1.8.1 | NOK | http://autobuild.buildroot.net/results/09afd71f839ee90f4ceb30e16c5d3be569d890fe
microblazeel | make[2]: *** [smartd.o] Ter... | TIM | http://autobuild.buildroot.net/results/3f54ca9823d8cc05d0f0ae1530c512925c943cc3
         arm | make[4]: *** [.moc/moc_audi... | TIM | http://autobuild.buildroot.net/results/328abd3aabe4c06baa00c3525605824b56aa75d1
        i686 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/c8856d9fec69012630cb94152b5335b632759f6f
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/aa977fdc76f17fd4d44184938684ff8b8eef89c2
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/c49c5365c7582ed6509086ea8c36e813749705a3
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/ee35e91ee2b0429c83e4d1ea5c018cf88ab64551
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/06ef10a49b88d82990757e6470f04554223b0217
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/8810630a8413511984c94834f633440744a0a44a
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/f1d19d3e5e6bb3fdf2a58f34d687c421407e77e6
         arm |                 openjpeg-2.1.2 | NOK | http://autobuild.buildroot.net/results/ba88b272bf64847e67b111000e4ee7aa9ea808fa
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/aceecbd184f26cf4b24ddd88b78b54a0d83ccb08
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/54aa121343171c1fb14251cfe2ee13ffd4ea1321
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/e80d72d57850f5075ac8917a03ca83d1a822649d
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/8700d48f13b6876d716fd5cc01d5bf65255a2728
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/7d783762b5a04efaeaa358f0057064db732acdb9
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/0733f90da43e2d8d5db26ebe9f664e453f3bc433
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/df16e927372bb72103e184a608f0330c7755e8bd
     powerpc |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/410e2a5d0757ac57c8048491a507856410014945
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/dcc34972206fa185e62de923836eb8193ec8790c
         arc |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/f459d2c1834d552740b9a4e8f61428efc2e50039
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/2b109166e89ae8b381b67c61c009b82e1fdac67c
      mipsel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/844d659d4fb30d5e1f7f6651e4fc9d2f3a7432ef
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/616c162ee6b1036dd3260971b9af2ce7c0ca8b7e
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/75bde28922d26ddae5be08d631c4f28215111d73
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/567fb0f4113a1c87c7ea94e4a8432164f6ccd4a6
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/160cf51cd353efec9bf2543214ead614420fbb14
         arm |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/84bde1cc332a040d5d0668240668bb08a4929fd5

-- 
http://autobuild.buildroot.net
