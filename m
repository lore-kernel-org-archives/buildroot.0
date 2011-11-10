From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 10 Nov 2011 20:31:34 +0100
Subject: [Buildroot] [PATCH 0 of 5 RFC] dependencies: some improvements
Message-ID: <patchbomb.1320911665@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series makes some changes in the dependencies code.

   dependencies: check core dependencies before anything else
   dependencies: add function suitable-host-package
   dependencies: build a host-tar if no suitable tar can be found
   dependencies: remove unused lzma checking scripts
   dirs and dependencies should be executed before every package

Although comments on all patches would be fine, I'm mainly troubled with the
last one ('dirs and dependencies...'). Please see the patch description there.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
