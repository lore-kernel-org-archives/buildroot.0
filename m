From: Brad House <brad@mainstreetsoftworks.com>
Date: Sun, 19 Aug 2007 13:22:28 -0400
Subject: [Buildroot] [patch] libxml2 install fails because of missing
 directory
In-Reply-To: <46C211DA.1090201@mainstreetsoftworks.com>
References: <46C211DA.1090201@mainstreetsoftworks.com>
Message-ID: <46C87C54.3080005@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> If libxml2 is installed before $(TARGET_DIR)/usr/lib is created,
> it fails because it can't copy the library over.
> 
> Also, the dependency tree is a bit messed up.  libxml2.a should
> only be installed if target-headers is specified, it's 4MB
> on my system and the only .a file I found in my TARGET_DIR
> (target-headers was not specified).
> 
> The attached patch fixes the above problems.

Any word on getting this patch committed?

Thanks.
-Brad
