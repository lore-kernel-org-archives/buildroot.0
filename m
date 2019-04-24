From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:29:15 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: move
 BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560 to Bluetooth
In-Reply-To: <20190416203225.AC1848EC79@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 16 Apr 2019 22:36:47 +0200")
References: <20190416203225.AC1848EC79@busybox.osuosl.org>
Message-ID: <87r29r6tb8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=0edbbe548f56367ead0feb354c27c0a0d42778e0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This moves the BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560 option to the
 > Bluetooth section of the config file. This chip is Bluetooth-only, so
 > it belongs there instead of with the Wi-Fi/Bluetooth combo chips.

 > Signed-off-by: David Lechner <david@lechnology.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
