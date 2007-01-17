From: thomas.luo <thomas.luo@ieee.org>
Date: Wed, 17 Jan 2007 14:56:36 +0800
Subject: [Buildroot] build root destroy the lib!
Message-ID: <006c01c73a04$a471f380$0696a8c0@Thomas>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi, all
  i meet some strange things. the buildroot tools destroy the lib which i copyed in.

i use the make modules_install copy all the modules to the build_arm/root folder.and type
make in the buildroot.

the modules file is be smaller!!

who can help me?

Dec 31 17:01:57 modprobe: WARNING: Error inserting snd_ac97_bus (/lib/modules/2.6.19/kernel/sound/pci/ac97/snd-ac97-bus.ko): Invalid 
module format


Br
Thomas
