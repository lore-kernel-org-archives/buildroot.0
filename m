From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Aug 2013 15:44:20 +0200
Subject: [Buildroot] libffi target header installation problem
In-Reply-To: <1731940843.5504088.1377524511657.JavaMail.root@openwide.fr>
References: <1626579523.5503469.1377524132514.JavaMail.root@openwide.fr>
 <1731940843.5504088.1377524511657.JavaMail.root@openwide.fr>
Message-ID: <20130826154420.72868235@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas M?n?gale,

On Mon, 26 Aug 2013 15:41:51 +0200 (CEST), Nicolas M?n?gale wrote:
> Hi Everyone,
> 
> In libffi.mk:23: 
> mv $(STAGING_DIR)/usr/lib/libffi-*/include/*.h $(STAGING_DIR)/usr/include/
> 
> Wouldn't it make more sense this way ?
> mv $(STAGING_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(STAGING_DIR)/usr/include/
> 
> Same thing for the LIBFFI_MOVE_TARGET_HEADERS hook below this line.
> 
> If so I can send a patch to correct that.

What "problem" are you seeing with the current code?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
