From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Mon, 30 Jul 2007 20:49:24 +0200 (CEST)
Subject: [Buildroot] --includedir=/usr/include vs
	--includedir=$(STAGING_DIR)/usr/include
Message-ID: <0707302043450.17391@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noticed that some .mk files use different --includedir= configure options.
Shouldn't --includedir=/usr/include be used everywhere?


Cheers,

-- 
Cristian
