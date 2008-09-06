From: Hodgson, Simon <Simon.Hodgson@nortechonline.co.uk>
Date: Sat, 6 Sep 2008 16:42:58 +0100
Subject: [Buildroot] Problems with make BOARD=...........
Message-ID: <B44D4D5BF344094DABB900C4E0F6E35301A1A1DDE3@srv02.nortechonline.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to make our buildroot build a simple single step repeatable build.

I've got a 'working' copy of buildroot which has become a bit of a mess, so I've done the following.

* make saveconfig on the 'working' copy

* Got a clean copy of buildroot from the svn repository

* Added that copy of buildroot into our company svn repository

* Copied local/at91sam9260dfc/ from the 'working' buildroot to the 'clean' buildroot

* Added the local folder also to our internal svn repository

* rm -rf * on the clean buildroot, svn update to get everything nice and clean

* make defconfig

* make BOARD=at91sam9260dfc

This then goes off and builds everything, but I have two problems:

 1. It stops and asks some questions... I thought I'd provided all the answers in the config.

 2. It the 'clean' binaries are vastly different to the 'working' ones, the new kernel is 1.7M in size rather than 924K, suggesting that it's not built what I asked for, (Can't test as this kernel is too big for my hardware)

Has anyone got any idea where I'm going wrong and what I might be able to do to put it right? I can supply my config files if required.


Thanks



Simon
