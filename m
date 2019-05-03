From: Gervais, Francois <FGervais@distech-controls.com>
Date: Fri, 3 May 2019 20:21:41 +0000
Subject: [Buildroot] Buildroot multi-arch build
Message-ID: <BL0PR0102MB341237052A8B224C63E58B9FF3350@BL0PR0102MB3412.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We use the same buildroot environment for x86_64, armhf and arm64.

For each architecture, everything is the same except for the architecture definition.

Is there a way to achieve this without maintaining 3 config files?
