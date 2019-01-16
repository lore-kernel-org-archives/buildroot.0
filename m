From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 21:03:18 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/linux-firmware : Install
 binary blobs for e100 ethernet driver
In-Reply-To: <20190113072648.18158-1-dplamp@gmx.com> (dplamp@gmx.com's message
 of "Sun, 13 Jan 2019 08:26:48 +0100")
References: <20190113072648.18158-1-dplamp@gmx.com>
Message-ID: <87ef9cbcah.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "dplamp" == dplamp  <dplamp@gmx.com> writes:

 > From: David Picard <dplamp@gmx.com>
 > Add an option in the menuconfig  submenu of linux-firmware package. Install
 > the firmware binary files to the target directory if the option is selected.

 > Signed-off-by: David Picard <dplamp@gmx.com>
 > ---
 > Changes v2 -> v3
 > - reformat the commit message
 > - add licence file hash

 > Changes v1 -> v2
 > - change BR2_PACKAGE_LINUX_FIRMWARE_E100 to BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
 > - change menu caption from "e100 / Intel 825xx" to "Intel e100 825xx"

Committed, thanks.

-- 
Bye, Peter Korsgaard
