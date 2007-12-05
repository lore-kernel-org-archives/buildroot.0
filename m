From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 4 Dec 2007 20:55:56 -0800 (PST)
Subject: [Buildroot]  linux fusion clean error due to extra )
Message-ID: <14165287.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Linux fusion clean fails due to extra ) 

rm -f
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/etc/udev/rules.d/40-fusion.rules)
/bin/sh: -c: line 0: syntax error near unexpected token `)'
/bin/sh: -c: line 0: `rm -f
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/etc/udev/rules.d/40-fusion.rules)'
make: *** [linux-fusion-clean] Error 2

fusion.mk

linux-fusion-clean:
	rm -f $(LINUX_FUSION_DIR)/$(LINUX_FUSION))
                                                                          ^
                                                                          |
Please remove the same.

regards
Gururaja
-- 
View this message in context: http://www.nabble.com/linux-fusion-clean-error-due-to-extra-%29-tf4947459.html#a14165287
Sent from the BuildRoot mailing list archive at Nabble.com.
