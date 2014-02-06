From: Peter Kuemmel <syntheticpp@gmx.net>
Date: Thu, 6 Feb 2014 16:44:28 +0100 (CET)
Subject: [Buildroot] [PATCH 1/2] Qt5: update to 5.2.1
In-Reply-To: <20140206162743.2ae6f50e@skate>
References: <trinity-66f5431b-92f8-44b8-9cb0-1f564a6cda9f-1391694043383@3capp-gmx-bs23>, 
 <20140206162743.2ae6f50e@skate>
Message-ID: <trinity-829bfcdd-24ed-4dd3-997e-5290eda10ee5-1391701468476@3capp-gmx-bs23>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> 
> As explained in the documentation, could you use "git send-email" to

Sorry, I thought using send-email is just optional.

So someone else interested should put it into the queue,
but don't use my signed-off patches.

The qttools patch needs a change:

+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Help.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5CLucene.so.* $(TARGET_DIR)/usr/lib

Thanks,
Peter

> send your patches? For the moment, they are sent as attached files,
> which is very unpractical for review.
> 
> Thanks a lot for these contributions!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
