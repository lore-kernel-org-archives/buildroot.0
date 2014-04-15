From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-14
Message-ID: <20140415063007.C8259100FAA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-14
===============================

        success : 54 
       failures : 38 
       timeouts : 2  
          TOTAL : 94 

Classification of failures by reason
====================================

                     mtd-1.5.1 | 12
             lttng-tools-2.4.0 | 6 
              jquery-ui-1.10.4 | 4 
                  zeromq-4.0.1 | 2 
make: *** [core-dependencie... | 2 
                    flac-1.3.0 | 1 
                 httping-2.3.4 | 1 
for file in config.guess co... | 1 
                 python3-3.4.0 | 1 
                 qt5base-5.2.1 | 1 
                  python-2.7.6 | 1 
                 mplayer-1.1.1 | 1 
                    mpd-0.18.9 | 1 
                    sudo-1.8.8 | 1 
                    fltk-1.3.2 | 1 
                    php-5.5.11 | 1 
In file included from /home... | 1 
        gst1-plugins-bad-1.2.3 | 1 
                  snmppp-3.3.4 | 1 

Detail of failures
===================

       arm |                     flac-1.3.0 | NOK | http://autobuild.buildroot.net/results/873a1b3551c5fe04fa477fd682ff91fecdd41606/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/bb2bbe28f80ae4eda175662b705bc54448dea69d/
  mips64el | for file in config.guess co... | TIM | http://autobuild.buildroot.net/results/e1fd3dae4910e945d591ee30101cee65f8a9329a/
       arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/172abd6fb4586610b3347e77884f6f87331c9ac5/
      bfin |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/697eaf086556ebc1665fa117c9b306aabab6330a/
    x86_64 | In file included from /home... | TIM | http://autobuild.buildroot.net/results/a2f1b0f6983a778e737396000727ac92cb475d55/
       arm |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/5f7212a249589a9c5bfbbbb14d8fab2a6ca6d2fb/
   powerpc |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/4e2ad07384645267f1bb62962ac92689ad1ab728/
    x86_64 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/e2e79fb4b53ee880bb28fa78054cec2aff6cd7f2/
       arc |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/7d892f06f431ca51dd711b7aa7e850bebc266ab9/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/a75d2a643dd3dc3866e66f9478f0af2ce18b31ff/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/e06a1492a6b596cab4ee1949f79a2df488e25bf7/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/f8c4f8e2574ba546aaf33456a8e4c630f338fd7f/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/876def3ebc7bed79011aba1d6c27cd0083f491c5/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/26f12499e4161616fc260b73b6b06fcbd832b478/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/d6c947a22e4c8f6b681b210ded03ba630f03fc62/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/cece0c50eb83a4c306a3ae17f1b1d54bea03091c/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/dd219cddc09170d531c41721f4ded657d7428c19/
   powerpc |                     mpd-0.18.9 | NOK | http://autobuild.buildroot.net/results/6a6a8431c0988f26ef1c1e83a954b53b96cf3d8d/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/0d58fa8d5f5e44d9aefda39aca2bd5d3d1a7f418/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/eeb5bcd379704af38757fb90c3134c2b7900a8ad/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/9260654a2f6501e1505576d9bf5b66afbcada1c5/
   powerpc |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/d2f5c7aee11bf6c57aca876cc26f45f5f30405f2/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/14062af69b713dae4a4d94d4da6fa8c081494b03/
       arm |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/94c0d4731153b5344fe790029f8cad71ab08c9ec/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/ff1c2ccd2ac39fc0c70ac22955a352f74390169d/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/e8cc55fbe338de46b222b6f35d357d5eaf19b795/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/29e68dc82d523c846fbead60ddbee3c649edde1c/
       arm |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/125056c858c6c6d90686d82a63b1a5cd9438a8b7/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/de76402214963537b077725eebf19103bb9f0a4d/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/48f4d93ca61d92a28c07b931ba6aeab6927e732f/
       arm |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/bfce0f7028413ee28cb437ae20009da4907d01b8/
       sh4 |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/c253a52c5a8e0d6399f6e3a39eccf8c6e1ef5a23/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/5524ee76f6513a0270c00a657d734c8e341da099/
     avr32 |                  python3-3.4.0 | NOK | http://autobuild.buildroot.net/results/cb0080e449345c2f22e8291786d9cbdcd36a3595/
      i686 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/4efdca53088bbd3994001173fea6f84bceb1150c/
   powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/acf2c152d9a6b29178dc6efc08507a2d23a93641/
       arm |                     sudo-1.8.8 | NOK | http://autobuild.buildroot.net/results/471810421065f138d3e03ade1e324c2e0a488cab/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/9df5a7b1ae92905701edc45aa26fd6258365c6bb/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/dd8ae533c1ca8fcbd1abb5bc0139d847abd3a26b/


-- 
http://autobuild.buildroot.net
