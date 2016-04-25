From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 14:13:13 +0200
Subject: [Buildroot] [PATCH] linux: use $(LINUX_INSTALL_IMAGE_CMDS)
 instead of plain 'cp'
In-Reply-To: <20160425140615.11e86412@free-electrons.com>
References: <571E0683.4080306@laposte.net>
 <20160425140615.11e86412@free-electrons.com>
Message-ID: <20160425141313.4d43654c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 14:06:15 +0200, Thomas Petazzoni wrote:

> > -	cp $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME).* $(1)
> > +	cp -v $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME).* $(1)
> 
> I think you did this change for debugging (which is OK), but it should
> be kept in your patch.

Obviously: it should be *removed* from your patch. Sorry for the
mess :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
