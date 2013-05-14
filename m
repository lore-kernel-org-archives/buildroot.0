From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 08:30:03 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-13
Message-ID: <20130514063004.8012052C105@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-13
===============================

        success : 89 
       failures : 35 
       timeouts : 35 
          TOTAL : 124

Classification of failures by reason
====================================

                  ne10-88c18f0 | 3 
                 cairo-1.12.10 | 3 
          host-protobuf-c-0.15 | 2 
                 binutils-2.21 | 2 
                 rt-tests-0.83 | 2 
                 pixman-0.28.2 | 2 
               czmq-cb9839cf90 | 1 
                libtirpc-0.2.2 | 1 
                    systemd-44 | 1 
               libglib2-2.30.3 | 1 
   host-lttng-babeltrace-1.0.2 | 1 
                directfb-1.6.3 | 1 
                mongrel2-1.8.0 | 1 
               aircrack-ng-1.1 | 1 
                    acl-2.2.51 | 1 
             util-linux-2.22.2 | 1 
              matchbox-lib-1.9 | 1 
                      qt-4.8.4 | 1 
                lmbench-3.0-a9 | 1 
               linux-pam-1.1.4 | 1 
               wvstreams-4.6.1 | 1 
               madplay-0.15.2b | 1 
                 libiconv-1.14 | 1 
                  libv4l-0.8.9 | 1 
media-ctl-ac40b79f002a2315f... | 1 
         host-gutenprint-5.2.9 | 1 
                libsigsegv-2.6 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/246c3ce58eb904854e616894e737d77483ad0250/
   powerpc |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/2441d8b62323a00f32f2edb7cb781dda71ff7f68/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/41bd79dc40f0f83f67d50dc9ed835edb22dd4543/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/c64973b6090c240012342f21f665cded0e67afd1/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d491de5a774592929a59f3bfd0b1fd8cbc089ac0/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2da939cc17009c82ea5e580a76a4dd441b02f66b/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/09da13807fe64b051adc6d6598ba57fe14840895/
      bfin |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/d3460c3140140cbec366cc2b58090cd244f96aa1/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ef8407863212d695e91ba0884c93420c7f77e144/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/ae14a7246ba6bb112615dc43e54385b315f2fa81/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/11fdc108f78c47f236d06aea3a002a1307617fde/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/3b7e7760cdd1c2ffa8845cd90f3c4424ae255010/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/1fb965a1c0e39e2d43214b7a740597570ed6a86d/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/e9d4d442cbe41233815b774b9f0c94d213877e50/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/830f6378ea74293f519459b6407522fd5af3d6de/
    x86_64 |                 libsigsegv-2.6 | NOK | http://autobuild.buildroot.net/results/c82c53723cd8e606f64fd7d7eb8d9bcea80c8ac5/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/0f020b47444586d5a74ec5f79f773b9f74eb900f/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/9c12812cb01762b19410fa4f2fb79a83db55bc83/
microblaze |                linux-pam-1.1.4 | NOK | http://autobuild.buildroot.net/results/63e8895a6001b89b38c5da7d29ddacc9a688cf0a/
    xtensa |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/62695acc3d70a67a49f65716494770f24b0eb5eb/
       arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/81cc2a3d834a83a991b45dcdfa6cc0457d9ebf59/
      i686 |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/48d37a98ded3b45d6f9acb071d8a0a74b63ab538/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/a44012641afadb3c636aa650361e42b53d0f2a2b/
      i686 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/1a451cf09271fdf9922154da70cc6586a24e2639/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/87b1fb0dce2f1dce78671fb9fcd08c9315a55537/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/11d847a7d79192348d4a0543a33de3ae46c55835/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/b331e1321617e333dc03d78f457856ebbbf471bb/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/97263b933a360b79972b28912636458cf275660e/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/0a255d2df780ffa0560f55558573ad8038ffd48b/
       arm |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/4cc7b7e5e6c10ee6a706dfe658a3ed341b6d7ebd/
       arc |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/bfbd82224a80f4446c5f9c1a37b95e910c9f181a/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/f90803bdc165c23567047e67f2b84eb8ae57f578/
    x86_64 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/e82365e0b7ccde24ec2a30cfb3de80562fdedc0d/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/2518936360ebed7cc3a26ffd09fe31d5d60b4fe1/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/748ff548189648607ae13e454fee710709718400/


-- 
http://autobuild.buildroot.net
