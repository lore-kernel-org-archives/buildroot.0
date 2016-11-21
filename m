From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-20
Message-ID: <20161121073014.5412820BEB@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-20
================================

      successes : 140
       failures : 26 
       timeouts : 1  
          TOTAL : 167

Classification of failures by reason
====================================

                    mpfr-3.1.5 | 4 
                    mpv-0.20.0 | 3 
          chocolate-doom-2.2.1 | 2 
         docker-engine-v1.12.2 | 2 
openblas-f04af36ad0e85b64f1... | 2 
             rabbitmq-c-v0.8.0 | 2 
               tcpreplay-4.1.1 | 2 
                bind-9.11.0-P1 | 1 
                    cups-2.1.4 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
               libepoxy-v1.3.1 | 1 
                   mpd-0.19.19 | 1 
                 opencv3-3.1.0 | 1 
qt5webkit-b35917bcb44d7f200... | 1 
                   taskd-1.1.0 | 1 
               vo-aacenc-0.1.3 | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/72e1559ba6a98cfd248d803c5bae29de9426ae8c
 powerpc64le |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/7876ff1946a25ed2a94d56cb30793695abcefb91
 powerpc64le |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/dbe6fe5f552ab831c8420cb8ac5ada3730da21a2
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/ed2a766f8919d12c248885b983e1712a1fe1dc4a
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/063842d007cada2a427d08d7b87b07be4df0fa6d
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/307b5dc9274567b9a267acc3e70d7614a583bc0c
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/4bbd95eb9b890b63502b72e0ff14c12682bdef26
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/d2fe30b8f985dd60d2ec0306c9955dce7c70fc8a
       sparc |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/c9cf3100014ddc5373d2f711d64a0adc1364311e
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/f27115e67c7e694c5c8e0863f1e316501e53ae64
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/83384c9cb8be0e406cdca66c606bfbfdb3e7d0a5
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/104d400be1fd1b0cb00004a260b53ed71529a049
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/75ea2a086a57e7ccb4024c80002f53569aaec847
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/875e851e2071e9515c4b0b49cf396e9503968434
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/d392c396403f8c2d1f05cd9b97bd90f7bab1c8ea
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/453f94c7602806ae73f9cd04fa3122b53468a315
   powerpc64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/74eeb78cd06e10df64b3a71399f5c48df7ce4258
   powerpc64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/bcc4f743eb1daadf46125d654ffb4c7bf4b843c5
        i586 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/8ab13204d020dfcccb9a321a83e64bed63c20961
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/c2081d497fedc201cf477936feade51257da1699
    mips64el |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/cf4ecd6532092a54c29e159a1184707fd8a94f2e
      mipsel |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/e60fc3b99f777921123c4b6defedb18a32984be2
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/16240b97ea821f87ce13bd788265ab3b0f2c56be
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/61a2018720e5d206cc6ad53b5c55b3c0964e5d74
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/97b6d9a59bdaddc4cd68925af50f28fc7a161ca8
      x86_64 |                vo-aacenc-0.1.3 | TIM | http://autobuild.buildroot.net/results/63c12eba8075ddb005539a7193642abd2f356b1c
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/f000fdcea4fe0992f5adea3c8dd7ceddeac02a6e

-- 
http://autobuild.buildroot.net
