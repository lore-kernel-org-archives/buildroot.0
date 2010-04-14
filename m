From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 10:16:00 +0200
Subject: [Buildroot] [PATCH 26/41] linux-fusion: bump to 8.1.1
In-Reply-To: <1271199974-30434-27-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 14 Apr 2010 01:05:59 +0200")
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-27-git-send-email-llandwerlin@gmail.com>
Message-ID: <87bpdmh2kf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

You should probably also mention in the commit msg that you've converted
it to GENTARGETS.

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>

 llandwerlin> +define LINUX_FUSION_UNINSTALL_TARGET_UDEV
 llandwerlin> +	rm -f $(LINUX_FUSION_ETC_DIR)/40-fusion.rules
 llandwerlin> +endef

This doesn't seem to be referred from anywhere?

-- 
Bye, Peter Korsgaard
