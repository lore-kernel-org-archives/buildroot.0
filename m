From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jan 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-29
Message-ID: <20150130073013.DA76C10177C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-29
===============================

        success : 252
       failures : 29 
       timeouts : 0  
          TOTAL : 281

Classification of failures by reason
====================================

                   mono-3.12.0 | 8 
                benejson-0.9.7 | 3 
           python-pyzmq-14.3.1 | 3 
               openldap-2.4.40 | 2 
              host-erlang-17.4 | 2 
                      qt-4.8.6 | 2 
                  cppcms-1.0.4 | 1 
                     rpm-5.2.0 | 1 
               host-qemu-2.1.2 | 1 
             libselinux-2.1.13 | 1 
                  ffmpeg-2.5.3 | 1 
           heirloom-mailx-12.5 | 1 
                      make-4.1 | 1 
               ding-libs-0_4_0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 

Detail of failures
===================

     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/d6a3c21938dddde45a427b42a7e0e37aa2426306/
        bfin |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/d531be2e7c4ee7d0a6767bcdcbd12e52d83153b2/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/bd138fc9cee13da850c81e8f9407f098a6a69c69/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/452bd817786c6876f15cb3f63506f886a5b6a815/
        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/d81c713121f7cce3bbde9373e870b93dee371847/
microblazeel |                   ffmpeg-2.5.3 | NOK | http://autobuild.buildroot.net/results/ad7c925b61bbe8b467d51a78f1b455d8b09709d9/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/66aeb08b0d6887f8037ee056e7902cea9fecd21a/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2dcdd95545ec5897d3bcafe04e846e77d35249be/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/86db46b4a3eabc748b00d4c1a1d4b09fe9e9c7ad/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/1e5537a490c1cd8faac4c6cdbc15e5687bfa4ce7/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a6eb38bfb6175f3de90cb5ae9277b74f83ac3e9c/
     powerpc |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/0469e0c9df1c7b6bfb59fa9c8d18e085f9fc86c3/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/cdb6a6ebfda673cf1a9c4768da293f2529fd697c/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/1822e339b558574fb823259ddf7a73d6ff9f3313/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/687d247a38de6195e1ff7657125464ff47294cec/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/80387c5a9481f29841d566161fef55839c9187bf/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/9daf24045d27215fb6fd4885288b14fd22d48c47/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/56e3be0530947301d3dfd66ce4c3c89eeae2fde2/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/124ab92fb2a4c5918777885cb0e6ea57b91a3897/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/766da348b0c44062a1b153b05f81bfd04c78deca/
        bfin |                openldap-2.4.40 | NOK | http://autobuild.buildroot.net/results/1ce0ac525217fc5308ea510c997c7ac59e69bc4c/
        bfin |                openldap-2.4.40 | NOK | http://autobuild.buildroot.net/results/0eb180f77d5b70886e062ada1be133916ac97c31/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/8d653dd40b95aca087d4bc19bc06e2b7cffb445a/
         sh4 |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/60f0907b5551eeeaccabc667a665c800ede7f33c/
         arc |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/a645f7929747b5e691c450784c051890b8f2f695/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/443a6d00e359574706e32f00e28190e55f7e32bb/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/c5d7752b02069c2f99af605c1231ce4da9e69e42/
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/42fbb4c3b4bbfe08027eee52a8001c3e1faa844e/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/71145d7f81e135eb816272f6f1351f3b64fa1aff/


-- 
http://autobuild.buildroot.net
