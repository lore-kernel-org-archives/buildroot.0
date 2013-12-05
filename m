From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Dec 2013 08:30:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-04
Message-ID: <20131205073003.4AE1F101506@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-04
===============================

        success : 71 
       failures : 100
       timeouts : 2  
          TOTAL : 173

Classification of failures by reason
====================================

                     gpsd-3.10 | 25
                  gnutls-3.2.7 | 22
              wireshark-1.10.3 | 8 
                aiccu-20070115 | 7 
tvheadend-c7d0335eb10d02b78... | 4 
               alsa-lib-1.0.26 | 3 
                  connman-1.19 | 3 
                       unknown | 2 
                 ffmpeg-0.8.15 | 2 
  toolchain-external-undefined | 2 
                  libeet-1.7.7 | 2 
                     nut-2.6.5 | 2 
            libvncserver-0.9.9 | 2 
             alsa-utils-1.0.26 | 2 
                  boost-1.54.0 | 1 
                     m4-1.4.17 | 1 
             libfreefare-0.3.4 | 1 
          qt5declarative-5.1.1 | 1 
         dvb-apps-be76da69f250 | 1 
                elfutils-0.155 | 1 
                 rt-tests-0.83 | 1 
                 mplayer-1.1.1 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                    tcl-8.4.19 | 1 
               libglib2-2.36.3 | 1 
                   mdadm-3.2.6 | 1 
              e2fsprogs-1.42.8 | 1 
               libsigsegv-2.10 | 1 
                     gdb-7.5.1 | 1 
                   lcdapi-v0.4 | 1 

Detail of failures
===================

       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/0d191774ed6460b5b0706c4a09a9c06cb2713d15/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/d42fcc15a2243415b02eb6ae338161164456f1cf/
    x86_64 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/016b578d19b10be161a62ed2503261d3a01381a2/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/bd99616723487b5efe97d68831fe1a7beba5ed8a/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/095b077278380485f666c187578fc446fae6cc34/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/582f3bc1d3f9334a67e2be95dd7be589f6f03b4e/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/84d6d5c5b60370dd9bfff2a10b41e1fbaea34f8a/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/2577da02bf9ef76ed999a09d85f1fc961f04d382/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/aeb2729d53e2d58f5f90aa3d68ef291b9aba9a41/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5e43ada5750e414171706f049a7f35c1bb59e1ca/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/6937dc36cb1a036c7627fb223f59b6e20e8aa90e/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/738e847e1c8d08267720e18cedc785d0cd39426a/
     avr32 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/a957486d13de7166b0f4dca9d217ea52e83ae6eb/
   aarch64 |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/33ae3fa3c976a2aa17092c176eac7ab0cce79793/
      mips |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/763b771a7c830a77faf04058f8558f04c8fd9cfd/
   powerpc |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/540a43ccafc2c9f3f82bc5f01927f5d319ccf87b/
   powerpc |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/f5ac6e13ddad345b18b0408e047f4478c8959a18/
     nios2 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/9cd64668b8c25e7b34f91f595dc50e425dcf6602/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/b32878e46da0cbf382de9ef01e8e2f9cff4203d8/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/611a4b9d1c3fe4e6302fa9711e49e5003fccdd78/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/ded1ece2cd2f993a9468bf1ff45b1a59d8e77e72/
     nios2 |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/073af3ac3fcd6cd30c69c0119cc45d677f6a7495/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/369b4c4e478c8c9648215dd9bbad0f5156b7e7f3/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/b655faf0cdb0d834b963056fca6558d84cca53d5/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/a5572c2c9d0763cc4b13e54adbb9157829efdfcd/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/d6322e1757eb79d42109a1815efc9621dfc5589e/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/6629f005a5d59d431a05d539c4846b8906bc9288/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/04e7524e91a8dafe9af51c846c8e44bc2ce97f05/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/fe29ef11ede21324ce2a7dd5b075e8b072db63a3/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/26c83bae412ff996ca1260bb1660a8bd1e1f0b77/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/1052245b5dda691b690db906b08755efb2c6d474/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/addec749b991566223e42a1889faadc57bcbae55/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/2300fe5838cf3ac07a5d51aa434c57d00810dd2a/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/99b0b8652cc8a4a465aa5cb643e294dbe3195e68/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/3a0d85d4b422252c7e026b0c7b24313cc52c5750/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/ffba04229f9211b46c10647f727ecfaafd0bf935/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/6c1fcb930453e0faf11f75946849cf3eb4e1081e/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/9c608f0e9be9b5e35ebbe2482b313b5f6ab5a619/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/2326f3a0c624c249fa1cfd7c3d4d29099e1499db/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/06c77f66c1900e2c5e378e1b352f9fab59401b3f/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/22846d2cd2dc3b192dffcce270bebbcd6951372d/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/416d0c7db2ad842c7e548dac0dea2d00302b3656/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/4353c92f683d8af0b4d31249826260bbecab5f56/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/6f50b3be71d6a9afc4feebe43fc78256ea70fa6a/
   aarch64 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/c069eb5564efafccf8410669bda6aca496a17c94/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/d8871cdd7e01f5d67f83c6bd376e416ad3d84eea/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/4a6ee47935bc365dc281da25e7fb5e69643a9695/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/bff9b890b701749faa1113810bcbdaa88f015fe3/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/0f86b49c7092f5eae51cbdf250685bbb2565c681/
     avr32 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/9f744103fa353cfb8efe579203b6769d13899de7/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/2558ada340e92b2f81053d2a0e41644c429a66bd/
      sh4a |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/4948daa1fec589fca93eb2ae210d73bb5fe48478/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/3cb12ade57610510599fc953c9edd7d1abb7162e/
    mipsel |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/bfdff1536cf04885e3dd1aa72df53ee9aab56a2f/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/e173f1de5ebf23a4fead1f26255abf30e98bd039/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/67a040fb04ec16ddd32edaa682a68f01cf59d2a3/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/5d2393faf95f325345ba49dd49d1c56eb2214e82/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/7dc4430e2f10077b14dbdd0299c0004093be2378/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/6195292fe4d1318ee8c4096b622450d2a2e4a22a/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/4ded9c88cda7f20a8c8802c92076d5c8585d22df/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/ad68661c1792c4ff6eab93b67731732ddbd396c4/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/74e88928cf69650e6905f89bd4904e2c452c1131/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/eb6d55f5af1e78e80d935022a6b1a35f33fba989/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/e9beec3d28eae9cc886832fa8dd934e7687acbfa/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/b298db752a8c48c5d5767bb5426c79e8d3175958/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/23d823726c52cefcd27744ea8e4abfd6185489d1/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/ffbcc6e7aa7e32907fa630259354b9635aa60be6/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/53e89805547276fd1fcf6d416c11e34200f9a25a/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/8e2c5e9871612b401dda30cdbf5f72ef99fe2bb5/
      bfin |                    lcdapi-v0.4 | NOK | http://autobuild.buildroot.net/results/83910af021d87942ab1fa11f343a99d2d9615e08/
       sh4 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/01a95a8a35c47d4d00b44114e731a80f2975e100/
      i686 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/36645ed5948f112632a17ed732dfbca8c94d6e2e/
    mipsel |              libfreefare-0.3.4 | NOK | http://autobuild.buildroot.net/results/f09d515f0e7b6d78010f1ce624336ceaef624989/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/db97ea25a5d7addb99c2acf4df6c4ff6475d0638/
     nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/4a666ed28217c4fb933fa67472d9a9a1afeed41b/
   aarch64 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/0bfc6325f47bedbb7b4b22a6da0fe70e6260f362/
      bfin |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/a6e871f232ab23a9a384286d53aa570c02d41095/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/6fd2df69be3c31488175e1a7f5ca23a19407ff44/
     avr32 |                    mdadm-3.2.6 | NOK | http://autobuild.buildroot.net/results/8e27d467c449269c26d8d00ff9f7be47aa88ec48/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/69baafd4258bcacbf57790a526054278ed2822d7/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/3bed65f119357c1983c8b54cbfbd6ad5bc21e659/
   powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/e3e4b59e49e8233a3d5ab794ce1c6714c89c6a9d/
       arm |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/bb86a1dd871e7098c9d29be8d6bd34565e81d9f4/
       arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/4fc4a12e65915c1e6cf8cdc48d5ce35a1dc286dd/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/798bffbb87a079ec2a1b846d53108ece46793c25/
       arc |                     tcl-8.4.19 | NOK | http://autobuild.buildroot.net/results/c8ea433a10797e90fef0b1853dd01318e937f542/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/193fcc94d7d948ae98c09e9fef01891487de7168/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/087d91ad56a58d27703fbe301251f37fd81f8471/
    xtensa | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/2879b095babe0f94a85af2b23ed09ddd5b3822fd/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/ae83036c5b402395abf79b11d21626fd51ea64b0/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/f6b1074084a525eb7d2dadabd5f69f615490f4ac/
  mips64el | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/5308902e2894041f98eb0dcf7978fc7fc1bd6023/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/1145051a3647529257f4ae48893702bb98da4297/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/258dbbad7b4ca3f36a4f376d48d2703b13ebc8d7/
   powerpc |               wireshark-1.10.3 | NOK | http://autobuild.buildroot.net/results/da9c6a664d721b0d92eb77378d340855d9123c67/
       arm |               wireshark-1.10.3 | NOK | http://autobuild.buildroot.net/results/d1574d68689b413fa8ccf36e9aa5ac7bcad89b5e/
   powerpc |               wireshark-1.10.3 | NOK | http://autobuild.buildroot.net/results/263a4b75e43b8115ec94dcb9c8755b195a85f7df/
       arm |               wireshark-1.10.3 | NOK | http://autobuild.buildroot.net/results/b5bb7c0c4c72a812bd7c83900004b1722533ed5b/
  mips64el |               wireshark-1.10.3 | NOK | http://autobuild.buildroot.net/results/df11eed04a62c9f3ebc5ea5d59764441c77b0a78/
   powerpc |               wireshark-1.10.3 | NOK | http://autobuild.buildroot.net/results/af36b72e4f215a6e57da31303d5a167d1c624d5f/
    mipsel |               wireshark-1.10.3 | NOK | http://autobuild.buildroot.net/results/2b1a0654b649618422d65edf370b82476ba84491/
    x86_64 |               wireshark-1.10.3 | NOK | http://autobuild.buildroot.net/results/4ac56174ba6b5aa008ae5f66a82982922f4a6d71/


-- 
http://autobuild.buildroot.net
