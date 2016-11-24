From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Nov 2016 08:30:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-23
Message-ID: <20161124073011.C2C1620BD5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-23
================================

      successes : 161
       failures : 25 
       timeouts : 1  
          TOTAL : 187

Classification of failures by reason
====================================

                 openssh-7.3p1 | 3 
qextserialport-ada321a9ee46... | 3 
                     gpsd-3.16 | 2 
                  autossh-1.4e | 1 
                bind-9.11.0-P1 | 1 
                    cups-2.1.4 | 1 
         docker-engine-v1.12.2 | 1 
                  gauche-0.9.4 | 1 
glmark2-fa71af2dfab711fac87... | 1 
               host-qemu-2.7.0 | 1 
make[1]: *** Waiting for un... | 1 
net-tools-3f170bff115303e92... | 1 
                    ola-0.10.2 | 1 
                oprofile-1.1.0 | 1 
                   perl-5.22.2 | 1 
               polarssl-1.2.19 | 1 
                      tar-1.29 | 1 
               tcpreplay-4.1.1 | 1 
vpnc-b1243d29e0c00312ead038... | 1 
                xfsprogs-4.7.0 | 1 
                  xl2tp-v1.3.6 | 1 


Detail of failures
===================

     powerpc |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/08a458572a2e9c599dd32b837b1e5c02a6721973
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/e14320a728975f2411451324739c8f30855d56b5
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/57446ad0e01a77710d2f986272b178de4f5dea51
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/42037d00edf075117f31d5199c77577eb31bc783
 powerpc64le |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/ba9a69e70127ae22be02561b1bf600b101fef541
         arm | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/3e0f5d0b5f6241ca2dc0627e2566d9cd7c9f5658
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/e8593a8ebf2f05cc93235a8129a2ba8b839d6d90
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/ff766f4f514c9cb4891873167f4e9b7870051883
   powerpc64 |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/f58ec73d906a5da49a88ed78492e3b5bf8cecdd4
         arm | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/cfde9ffd87d95e956b3359d1ad7522366c9336de
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/7f9f1143cbd8700c8d5a3360373bd11fcf3d3821
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/750c9bcc753e2c1b7b05d6c43fabf4c405e15f04
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/83f389d6ace773f4d9b1f7db236f6dbeebee911b
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/0a9c3b18d01f5c5cad34b86888557cbcf91672c7
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/c3c96788d37fa14e0ccf034f85771d6ad2692f56
   powerpc64 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/314446eb6824277187ce3e2a7285226d67f731f5
         arc |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/34d8fd6f3e137bdfbe7c4ccc9061059282773df6
      x86_64 |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/3aa3edd71c0a0c879939191b750d07bd9e868797
      xtensa | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/818b564a6e23bcecf4afc7e53811227b08e5f4eb
         arc | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/0b6c2d7c63329f5e790f02ccd29f14a317eadc71
        mips | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/ac552b63c6fb099a136066cda421f68e639808fa
         arm |                       tar-1.29 | NOK | http://autobuild.buildroot.net/results/6c06943f6e08ad3d910206abf9b9ec96d67afc3e
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/5aa6df0d88b55e44175cb28a96925b7b094284e3
         arm | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/18ae43d13038f74a39cb1da10a3e54e7e9c204f9
        i586 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/372ca24077b17ba1a9829e817dd73e852b12fb05
         arm |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/baea66ac57aa34c7d7bdc993544c0f010fee4a9b

-- 
http://autobuild.buildroot.net
