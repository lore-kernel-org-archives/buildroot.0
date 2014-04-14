From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-13
Message-ID: <20140414063009.3F4A6100DD1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-13
===============================

        success : 61 
       failures : 24 
       timeouts : 5  
          TOTAL : 90 

Classification of failures by reason
====================================

                 mesa3d-10.0.4 | 3 
            host-omniorb-4.1.6 | 3 
ne10-88c18f02199947b2c8b577... | 2 
                  snmppp-3.3.4 | 2 
             lttng-tools-2.4.0 | 2 
                  cppcms-1.0.4 | 2 
znc-b396cafdb249544164ed029... | 1 
                xapp_xwd-1.0.6 | 1 
make[1]: Entering directory... | 1 
zmqpp-36413487f05b165dfc82a... | 1 
              jquery-ui-1.10.4 | 1 
  CC       libdissectors_la... | 1 
                   cups-1.3.11 | 1 
                     CC	libavu | 1 
                     mtd-1.5.1 | 1 
         checking for strings. | 1 
                    flac-1.3.0 | 1 
(cd /home/test/test/3/outpu... | 1 
jack2-37976441044d69b91d61d... | 1 
        gst1-plugins-bad-1.2.3 | 1 
                  zeromq-4.0.1 | 1 

Detail of failures
===================

   powerpc |   CC       libdissectors_la... | TIM | http://autobuild.buildroot.net/results/aed1d8a5ece13d40d8e6910c7731588ff0149ccb/
  mips64el | (cd /home/test/test/3/outpu... | TIM | http://autobuild.buildroot.net/results/75c89d7c6af4487583bf9b9af14975a19b31bcc1/
microblazeel |                      CC	libavu | TIM | http://autobuild.buildroot.net/results/64ea5e3d249a7c3cc69f4928fbbd8223117f8eaf/
  mips64el |          checking for strings. | TIM | http://autobuild.buildroot.net/results/2b9746ea23d5de7a202cb8d98b805752fbab876a/
       arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/d618de68c8a50a932e85bdefb23c40e86790dc6c/
     avr32 |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/e362c05abee63635fcab6ec01f37148657869296/
       arm |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/dbad30d676961113d9dfc94ab612312d41d82fc9/
       arm |                     flac-1.3.0 | NOK | http://autobuild.buildroot.net/results/9b35cdc2ed538c978bf1389e1120ab5348a9cf8f/
      i686 |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/bcc3ad3eec73759a38c5fc6aacadeb5b252a23b0/
    xtensa |             host-omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/b4f3a2602ba0224ac3253c4bf6ed87ec045df772/
       sh4 |             host-omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/382bed1e4f4432ce6b0c20ab74234745a6de39fe/
      i686 |             host-omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/0da187ce16bf9b28d32bb2f9a7436a1174bf5f04/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/bef5d5daa32ddf5544a512b6da3ece948a36a32e/
       arm |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/a7b54795329e30f0b853e31ad7e3734344dc07a2/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/01fdb5302807d64ddcfe1e5c2a89d6f4d07cbf84/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/685339b6086b9b60bfdc8b7e1593506e7cb6c9bc/
    x86_64 | make[1]: Entering directory... | TIM | http://autobuild.buildroot.net/results/431dcf59cff4364f0bf599f883f618d6abcdfcb8/
       arm |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/9ec214dfa16e329eb5a6ead3d7e1561ea4cd441b/
    xtensa |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/58deb3be825064848c5a1ceeee1aa955043cdc9c/
  mips64el |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/4f6921661adfae1bcf7c617ab7f8a8021160bf13/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/0d24f506c7603a833ed72a5b0267111b8353f88f/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/dac3c10d45e542704d83207107c4a64eb8867306/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/28f6e6da34b534664d297253060f5cd801b55b16/
      bfin |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/61d0fb4695e776937b84a0a4215f5a5799edf8a9/
      i686 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/f38c12d1c1ed2ee73fd6b8e97ff2a5ed4520ae90/
   powerpc |                 xapp_xwd-1.0.6 | NOK | http://autobuild.buildroot.net/results/d3fa8f9aa51bb759f425e389a7969d1b36c48afc/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/e9d7d52f59efff06e59d8339b1a31d86a76c4f91/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/b0418ce3aa5221cb5fef64cd14fd5549ed30c1db/
       arm | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/60bc1479ac9f274e90d2a214dadead4d33f4a812/


-- 
http://autobuild.buildroot.net
