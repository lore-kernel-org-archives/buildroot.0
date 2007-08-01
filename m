From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 1 Aug 2007 02:47:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
In-Reply-To: <20070801083612.9A6C4A60E8@busybox.net>
References: <20070801083612.9A6C4A60E8@busybox.net>
Message-ID: <11942636.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I think even this needs to be added 

-$(TARGET_DIR)/usr/lib/libpng.so: $(STAGING_DIR)/lib/libpng.so
+$(TARGET_DIR)/usr/lib/libpng.so: $(STAGING_DIR)/usr/lib/libpng.so
- cp -dpf $(STAGING_DIR)/lib/libpng*.so* $(TARGET_DIR)/usr/lib/
+ cp -dpf $(STAGING_DIR)/usr/lib/libpng*.so* $(TARGET_DIR)/usr/lib/

Regards
Gururaja

-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-libpng-tf4198722.html#a11942636
Sent from the BuildRoot mailing list archive at Nabble.com.
