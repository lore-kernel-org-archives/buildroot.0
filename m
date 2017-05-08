From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 May 2017 21:05:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: wordexp is
	enabled in uClibc now
In-Reply-To: <20170508153646.10541-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 8 May 2017 17:36:46 +0200")
References: <20170508153646.10541-1-bernd.kuhls@t-online.de>
Message-ID: <87r2zznp80.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Package can now be used for uClibc toolchains.
 > Tested using this defconfig:

 > BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 > BR2_PACKAGE_BLUEZ5_UTILS=y
 > BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=y
 > BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED=y
 > BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL=y
 > BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH=y
 > BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI=y
 > BR2_PACKAGE_BLUEZ5_PLUGINS_NFC=y
 > BR2_PACKAGE_BLUEZ5_PLUGINS_SAP=y
 > BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS=y
 > BR2_PACKAGE_BLUEZ5_UTILS_TEST=y

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
