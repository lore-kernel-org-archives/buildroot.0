From: Jaap Crezee <jaap@jcz.nl>
Date: Sat, 30 May 2020 18:08:29 +0200
Subject: [Buildroot] make sdk - relocate - ccache not working as expected
Message-ID: <2b30abbf-41ab-253e-0c91-6bb6cf5e36a5@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,



I am using a Buildroot generated (make sdk; 2020.02) toolchain which I use on different
computers and I run into a problem where ccache keeps using the orignal temporary location
for the ccache cache, despite having ran sdk-relocate.sh:


Relocating the buildroot SDK from
/data/work/jcz/git/jidiot/clients/demo_rpi/buildroot_initramfs/output/host to
/var/lib/jenkins/workspace/argets_Demo_rpi_feature_rpi_zero/toolchain/ext ...
...
ccache: error: Failed to create directory
/data/work/jcz/git/jidiot/clients/demo_rpi/.cache/cc/tmp: Permission denied


Is this a known problem? If not, how to proceed?

regards,


Jaap Crezee
