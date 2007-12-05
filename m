From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 4 Dec 2007 21:01:37 -0800 (PST)
Subject: [Buildroot]  version bumps needed for few packages
Message-ID: <14165382.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

Below are the latest version that i tried and which are working fine at my
end on arm926ejs eabi toolchain

udev
UDEV_VERSION:=117
UDEV_VOLUME_ID_AGE:=81

usbutils
USBUTILS_VERSION:=0.73

Also just a small request. is it possible to add/enable ts_test util inside
ts_lib package
             cp -dpf $(STAGING_DIR)/usr/bin/ts_test $(TARGET_DIR)/usr/bin/
	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/ts_test

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/version-bumps-needed-for-few-packages-tf4947498.html#a14165382
Sent from the BuildRoot mailing list archive at Nabble.com.
