From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 11 May 2014 17:38:44 +0200
Subject: [Buildroot] [PATCH 0 of 7] infra: fix dollar signs;
	remove some undefined versions
Message-ID: <patchbomb.1399822724@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

This patch series fixes the double sign problem in the inner-xxx-targets
(see description in the patch itself), and makes the following semi-related
changes:
- convert toolchain and toolchain-buildroot package to virtual-package
- change toolchain-external package to have a virtual version
- change makedevs and mkpasswd to have a 'buildroot' version

The changes are related in the sense that the double dollar signs were
needed to correctly implement the subsequent patches.

Best regards,
Thomas
